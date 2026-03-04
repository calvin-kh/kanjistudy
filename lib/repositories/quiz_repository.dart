import '../database/database_service.dart';
import '../models/quiz.dart';

class QuizRepository {
  final DatabaseService db;

  QuizRepository(this.db);

  // ========== Quiz Item Stats ==========

  Future<QuizItemStats?> getItemStats(int kanjiId, String quizType) async {
    final result = await db.query(
      'SELECT * FROM quiz_item_stats WHERE kanjiId = ? AND quizType = ? LIMIT 1',
      [kanjiId, quizType],
    );
    if (result.rows.isEmpty) return null;
    return _statsFromRow(_rowToMap(result.rows.first, result.columns));
  }

  Future<void> updateItemStats(int kanjiId, String quizType, bool isCorrect) async {
    final now = DateTime.now().toUtc().toIso8601String();

    // Ensure stats row exists
    await db.execute(
      '''
      INSERT OR IGNORE INTO quiz_item_stats
        (kanjiId, quizType, quizCount, correctCount, incorrectCount, createdAt, updatedAt)
      VALUES (?, ?, 0, 0, 0, ?, ?)
      ''',
      [kanjiId, quizType, now, now],
    );

    if (isCorrect) {
      await db.execute(
        '''
        UPDATE quiz_item_stats
        SET quizCount = quizCount + 1,
            correctCount = correctCount + 1,
            lastQuizzedAt = ?,
            lastCorrectAt = ?,
            updatedAt = ?
        WHERE kanjiId = ? AND quizType = ?
        ''',
        [now, now, now, kanjiId, quizType],
      );
    } else {
      await db.execute(
        '''
        UPDATE quiz_item_stats
        SET quizCount = quizCount + 1,
            incorrectCount = incorrectCount + 1,
            lastQuizzedAt = ?,
            lastIncorrectAt = ?,
            updatedAt = ?
        WHERE kanjiId = ? AND quizType = ?
        ''',
        [now, now, now, kanjiId, quizType],
      );
    }
  }

  /// Priority ordering: incorrect > untested > oldest
  Future<List<int>> getPriorityKanjiIds(
    String quizType, {
    int? jlptLevel,
    int limit = 10,
  }) async {
    final levelFilter = jlptLevel != null ? 'AND k.jlptLevel = ?' : '';
    final params = <Object?>[quizType];
    if (jlptLevel != null) params.add(jlptLevel);
    params.add(limit);

    final result = await db.query(
      '''
      SELECT k.id FROM kanji k
      LEFT JOIN quiz_item_stats s
        ON k.id = s.kanjiId AND s.quizType = ?
      WHERE 1=1 $levelFilter
      ORDER BY
        COALESCE(s.incorrectCount, 0) DESC,
        CASE WHEN s.quizCount IS NULL OR s.quizCount = 0 THEN 0 ELSE 1 END,
        COALESCE(s.lastQuizzedAt, '1970-01-01') ASC
      LIMIT ?
      ''',
      params,
    );
    return result.rows.map((r) => r[0] as int).toList();
  }

  // ========== Quiz Results ==========

  Future<int> saveResult(QuizResult result) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await db.execute(
      '''
      INSERT INTO quiz_results
        (kanjiId, quizType, userAnswer, correctAnswer, isCorrect, createdAt)
      VALUES (?, ?, ?, ?, ?, ?)
      ''',
      [
        result.kanjiId,
        result.quizType,
        result.userAnswer,
        result.correctAnswer,
        result.isCorrect ? 1 : 0,
        now,
      ],
    );
    final idResult = await db.query('SELECT last_insert_rowid() as id');
    return idResult.rows.first[0] as int;
  }

  // ========== Statistics ==========

  Future<int> getTotalQuizCount() async {
    final result = await db.query('SELECT COUNT(*) FROM quiz_results');
    return result.rows.first[0] as int? ?? 0;
  }

  Future<int> getTotalCorrectCount() async {
    final result = await db.query(
      'SELECT COUNT(*) FROM quiz_results WHERE isCorrect = 1',
    );
    return result.rows.first[0] as int? ?? 0;
  }

  Future<int> getTodayQuizCount() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day).toIso8601String();
    final result = await db.query(
      'SELECT COUNT(*) FROM quiz_results WHERE createdAt >= ?',
      [startOfDay],
    );
    return result.rows.first[0] as int? ?? 0;
  }

  Future<int> getTodayCorrectCount() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day).toIso8601String();
    final result = await db.query(
      'SELECT COUNT(*) FROM quiz_results WHERE isCorrect = 1 AND createdAt >= ?',
      [startOfDay],
    );
    return result.rows.first[0] as int? ?? 0;
  }

  // ─── Helpers ───

  Map<String, dynamic> _rowToMap(List<dynamic> row, List<String> columns) {
    final map = <String, dynamic>{};
    for (var i = 0; i < columns.length; i++) {
      map[columns[i]] = row[i];
    }
    return map;
  }

  QuizItemStats _statsFromRow(Map<String, dynamic> row) {
    return QuizItemStats(
      id: row['id'] as int?,
      kanjiId: row['kanjiId'] as int,
      quizType: row['quizType'] as String,
      quizCount: row['quizCount'] as int? ?? 0,
      correctCount: row['correctCount'] as int? ?? 0,
      incorrectCount: row['incorrectCount'] as int? ?? 0,
      lastQuizzedAt: _parseDateTime(row['lastQuizzedAt']),
      lastCorrectAt: _parseDateTime(row['lastCorrectAt']),
      lastIncorrectAt: _parseDateTime(row['lastIncorrectAt']),
      createdAt: _parseDateTime(row['createdAt']),
      updatedAt: _parseDateTime(row['updatedAt']),
    );
  }

  DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}
