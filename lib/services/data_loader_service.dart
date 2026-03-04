import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../database/database_service.dart';

/// JSON 한자 데이터를 SQLite에 로딩하는 서비스
class DataLoaderService {
  final DatabaseService db;

  DataLoaderService(this.db);

  /// 데이터 로딩 여부 확인
  Future<bool> isDataLoaded() async {
    final result = await db.query(
      "SELECT value FROM app_meta WHERE key = 'data_version'",
    );
    return result.rows.isNotEmpty;
  }

  /// 현재 데이터 버전
  Future<String?> getDataVersion() async {
    final result = await db.query(
      "SELECT value FROM app_meta WHERE key = 'data_version'",
    );
    if (result.rows.isEmpty) return null;
    return result.rows.first[0] as String?;
  }

  /// 모든 JLPT 레벨 데이터 로딩
  Future<void> loadAllData() async {
    const levels = [5, 4, 3, 2, 1];

    for (final level in levels) {
      await _loadLevel(level);
    }

    // 데이터 버전 기록
    final now = DateTime.now().toUtc().toIso8601String();
    await db.execute(
      "INSERT OR REPLACE INTO app_meta (key, value, updatedAt) VALUES ('data_version', '1.0.0', ?)",
      [now],
    );

    if (kDebugMode) {
      final countResult = await db.query('SELECT COUNT(*) FROM kanji');
      final count = countResult.rows.first[0];
      print('[DataLoader] Total kanji loaded: $count');
    }
  }

  Future<void> _loadLevel(int level) async {
    final fileName = 'assets/data/kanji_n$level.json';

    try {
      final jsonString = await rootBundle.loadString(fileName);
      final List<dynamic> kanjiList = jsonDecode(jsonString);

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
        final now = DateTime.now().toUtc().toIso8601String();

        await db.execute(
          '''
          INSERT OR IGNORE INTO kanji
            (character, onyomi, kunyomi, meanings, strokeCount, jlptLevel, grade, examples, createdAt)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
          ''',
          [character, onyomi, kunyomi, meanings, strokeCount, level, grade, examples, now],
        );
      }

      if (kDebugMode) {
        print('[DataLoader] Loaded N$level: ${kanjiList.length} kanji');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[DataLoader] Failed to load N$level: $e');
      }
    }
  }
}
