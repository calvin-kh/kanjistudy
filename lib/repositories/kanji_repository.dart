import 'dart:convert';
import '../database/database_service.dart';
import '../models/kanji.dart';
import '../utils/kana.dart';

class KanjiRepository {
  final DatabaseService db;

  KanjiRepository(this.db);

  /// Get all kanji for a JLPT level
  Future<List<Kanji>> getByLevel(int level, {int limit = 200, int offset = 0}) async {
    final result = await db.query(
      'SELECT * FROM kanji WHERE jlptLevel = ? ORDER BY id LIMIT ? OFFSET ?',
      [level, limit, offset],
    );
    return result.rows.map((r) => _fromRow(_rowToMap(r, result.columns))).toList();
  }

  /// Get multiple kanji by IDs
  Future<List<Kanji>> getByIds(List<int> ids) async {
    if (ids.isEmpty) return [];
    final placeholders = ids.map((_) => '?').join(',');
    final result = await db.query(
      'SELECT * FROM kanji WHERE id IN ($placeholders) ORDER BY jlptLevel DESC, id',
      ids,
    );
    return result.rows.map((r) => _fromRow(_rowToMap(r, result.columns))).toList();
  }

  /// Get kanji by ID
  Future<Kanji?> getById(int id) async {
    final result = await db.query(
      'SELECT * FROM kanji WHERE id = ?',
      [id],
    );
    if (result.rows.isEmpty) return null;
    return _fromRow(_rowToMap(result.rows.first, result.columns));
  }

  /// Get kanji by character
  Future<Kanji?> getByCharacter(String character) async {
    final result = await db.query(
      'SELECT * FROM kanji WHERE character = ?',
      [character],
    );
    if (result.rows.isEmpty) return null;
    return _fromRow(_rowToMap(result.rows.first, result.columns));
  }

  /// Count kanji by level
  Future<int> countByLevel(int level) async {
    final result = await db.query(
      'SELECT COUNT(*) as count FROM kanji WHERE jlptLevel = ?',
      [level],
    );
    return result.rows.first[0] as int;
  }

  /// Count all kanji
  Future<int> countAll() async {
    final result = await db.query('SELECT COUNT(*) as count FROM kanji');
    return result.rows.first[0] as int;
  }

  /// Count kanji per level (returns map: level -> count)
  Future<Map<int, int>> countPerLevel() async {
    final result = await db.query(
      'SELECT jlptLevel, COUNT(*) as count FROM kanji GROUP BY jlptLevel ORDER BY jlptLevel DESC',
    );
    final map = <int, int>{};
    for (final row in result.rows) {
      map[row[0] as int] = row[1] as int;
    }
    return map;
  }

  /// Search kanji by character, reading, or meaning
  ///
  /// 음독은 후리가나로 노출되지만 DB에는 카타카나로 저장되어 있으므로,
  /// 히라가나/카타카나 어느 쪽으로 입력해도 양쪽 읽기가 모두 매칭되도록
  /// 검색어를 두 표기로 정규화해 대조한다.
  Future<List<Kanji>> search(String query) async {
    final pattern = '%$query%';
    final katakanaPattern = '%${Kana.toKatakana(query)}%';
    final hiraganaPattern = '%${Kana.toHiragana(query)}%';

    final result = await db.query(
      '''
      SELECT * FROM kanji
      WHERE character LIKE ?
         OR onyomi LIKE ?
         OR onyomi LIKE ?
         OR kunyomi LIKE ?
         OR kunyomi LIKE ?
         OR meanings LIKE ?
      ORDER BY jlptLevel DESC, id
      LIMIT 50
      ''',
      [
        pattern,
        pattern,
        katakanaPattern,
        pattern,
        hiraganaPattern,
        pattern,
      ],
    );
    return result.rows.map((r) => _fromRow(_rowToMap(r, result.columns))).toList();
  }

  /// Get random kanji for quiz (excluding specific IDs)
  Future<List<Kanji>> getRandomForQuiz({
    int? jlptLevel,
    int limit = 4,
    List<int> excludeIds = const [],
  }) async {
    final where = <String>[];
    final params = <Object?>[];

    if (jlptLevel != null) {
      where.add('jlptLevel = ?');
      params.add(jlptLevel);
    }
    if (excludeIds.isNotEmpty) {
      where.add('id NOT IN (${excludeIds.map((_) => '?').join(',')})');
      params.addAll(excludeIds);
    }

    final whereClause = where.isNotEmpty ? 'WHERE ${where.join(' AND ')}' : '';
    params.add(limit);

    final result = await db.query(
      'SELECT * FROM kanji $whereClause ORDER BY RANDOM() LIMIT ?',
      params,
    );
    return result.rows.map((r) => _fromRow(_rowToMap(r, result.columns))).toList();
  }

  // ─── Helpers ───

  Map<String, dynamic> _rowToMap(List<dynamic> row, List<String> columns) {
    final map = <String, dynamic>{};
    for (var i = 0; i < columns.length; i++) {
      map[columns[i]] = row[i];
    }
    return map;
  }

  Kanji _fromRow(Map<String, dynamic> row) {
    List<String> meanings;
    try {
      meanings = (jsonDecode(row['meanings'] as String) as List)
          .map((e) => e.toString())
          .toList();
    } catch (_) {
      meanings = [row['meanings'] as String];
    }

    List<KanjiExample> examples;
    try {
      final examplesJson = jsonDecode(row['examples'] as String? ?? '[]') as List;
      examples = examplesJson.map((e) => KanjiExample.fromJson(e as Map<String, dynamic>)).toList();
    } catch (_) {
      examples = [];
    }

    // 음독은 DB에 카타카나로 저장되어 있다. 앱 전역에서 후리가나(히라가나)로
    // 노출하기 위해 이 한 곳에서만 변환한다. DB 원본은 건드리지 않으므로
    // 표기 방식을 되돌리려면 이 줄만 되돌리면 된다.
    final onyomiRaw = row['onyomi'] as String?;

    return Kanji(
      id: row['id'] as int,
      character: row['character'] as String,
      onyomi: onyomiRaw == null ? null : Kana.toHiragana(onyomiRaw),
      kunyomi: row['kunyomi'] as String?,
      meanings: meanings,
      strokeCount: row['strokeCount'] as int?,
      jlptLevel: row['jlptLevel'] as int,
      grade: row['grade'] as int?,
      examples: examples,
      createdAt: row['createdAt'] != null ? DateTime.tryParse(row['createdAt'] as String) : null,
    );
  }
}
