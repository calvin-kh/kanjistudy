import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../database/database_service.dart';

/// JSON 한자 데이터를 SQLite에 로딩/동기화하는 서비스
///
/// ## 기존 사용자 데이터 보존 규칙 (중요)
///
/// `favorites`, `study_progress`, `quiz_item_stats`, `quiz_results`는 모두
/// `kanji.id` 정수값을 FK로 물고 있다. 따라서 한자 마스터 데이터를
/// 지우고 다시 넣으면(`DELETE` + `INSERT`) AUTOINCREMENT id가 재발급되어
/// 즐겨찾기/학습진도/퀴즈통계가 통째로 유실되거나 엉뚱한 한자에 붙는다.
///
/// 그래서 동기화는 **절대 삭제하지 않고** `character`(UNIQUE) 기준으로
/// - 신규 한자는 INSERT OR IGNORE 로 추가하고
/// - 기존 한자는 UPDATE ... WHERE character = ? 로 내용만 갱신한다.
///
/// 이렇게 하면 id가 그대로 유지되어 사용자 데이터가 전부 승계된다.
///
/// UPSERT(`ON CONFLICT DO UPDATE`)를 쓰지 않는 이유: minSdk 21의 안드로이드
/// 시스템 SQLite는 3.8.x 라 UPSERT(3.24+)를 지원하지 않는다.
class DataLoaderService {
  final DatabaseService db;

  DataLoaderService(this.db);

  /// assets/data/*.json 내용이 바뀌면 반드시 이 값을 올릴 것.
  /// 이 값이 app_meta의 저장값과 다르면 앱 시작 시 재동기화가 실행된다.
  static const String kDataVersion = '1.1.0';

  static const List<int> _levels = [5, 4, 3, 2, 1];

  /// 현재 기기에 적재된 데이터 버전
  Future<String?> getDataVersion() async {
    final result = await db.query(
      "SELECT value FROM app_meta WHERE key = 'data_version'",
    );
    if (result.rows.isEmpty) return null;
    return result.rows.first[0] as String?;
  }

  /// 앱 시작 시 호출. 최초 설치면 전체 적재, 기존 설치면 데이터 버전이
  /// 다를 때만 재동기화한다. 버전이 같으면 아무 것도 하지 않는다.
  Future<void> syncIfNeeded() async {
    final installed = await getDataVersion();

    if (installed == kDataVersion) {
      if (kDebugMode) {
        print('[DataLoader] Data up to date (v$installed)');
      }
      return;
    }

    if (kDebugMode) {
      print('[DataLoader] Syncing data: ${installed ?? 'none'} -> $kDataVersion');
    }

    await loadAllData();
  }

  /// 모든 JLPT 레벨 데이터 적재/갱신
  Future<void> loadAllData() async {
    for (final level in _levels) {
      await _syncLevel(level);
    }

    // 데이터 버전 기록
    final now = DateTime.now().toUtc().toIso8601String();
    await db.execute(
      "INSERT OR REPLACE INTO app_meta (key, value, updatedAt) VALUES ('data_version', ?, ?)",
      [kDataVersion, now],
    );

    if (kDebugMode) {
      final countResult = await db.query('SELECT COUNT(*) FROM kanji');
      final count = countResult.rows.first[0];
      print('[DataLoader] Total kanji after sync: $count');
    }
  }

  Future<void> _syncLevel(int level) async {
    final fileName = 'assets/data/kanji_n$level.json';

    try {
      final jsonString = await rootBundle.loadString(fileName);
      final List<dynamic> kanjiList = jsonDecode(jsonString);
      final now = DateTime.now().toUtc().toIso8601String();

      final batch = db.database.batch();
      for (final kanjiData in kanjiList) {
        final character = kanjiData['character'] as String;
        final onyomi = kanjiData['onyomi'] as String?;
        final kunyomi = kanjiData['kunyomi'] as String?;
        final meanings = jsonEncode(kanjiData['meanings'] as List);
        final strokeCount = kanjiData['strokeCount'] as int?;
        final grade = kanjiData['grade'] as int?;
        final examples = kanjiData['examples'] != null
            ? jsonEncode(kanjiData['examples'] as List)
            : '[]';

        // 1) 신규 한자만 추가. 이미 있으면 무시되어 기존 id가 보존된다.
        batch.rawInsert(
          '''
          INSERT OR IGNORE INTO kanji
            (character, onyomi, kunyomi, meanings, strokeCount, jlptLevel, grade, examples, createdAt)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
          ''',
          [
            character,
            onyomi,
            kunyomi,
            meanings,
            strokeCount,
            level,
            grade,
            examples,
            now,
          ],
        );

        // 2) 기존 한자의 내용을 최신 JSON으로 갱신. character 기준이므로
        //    id는 그대로 유지되고 사용자 데이터 FK가 전부 살아있다.
        //    createdAt은 최초 적재 시각을 보존하기 위해 갱신하지 않는다.
        batch.rawUpdate(
          '''
          UPDATE kanji SET
            onyomi = ?, kunyomi = ?, meanings = ?, strokeCount = ?,
            jlptLevel = ?, grade = ?, examples = ?
          WHERE character = ?
          ''',
          [
            onyomi,
            kunyomi,
            meanings,
            strokeCount,
            level,
            grade,
            examples,
            character,
          ],
        );
      }
      await batch.commit(noResult: true);

      if (kDebugMode) {
        print('[DataLoader] Synced N$level: ${kanjiList.length} kanji');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[DataLoader] Failed to sync N$level: $e');
      }
      rethrow;
    }
  }
}
