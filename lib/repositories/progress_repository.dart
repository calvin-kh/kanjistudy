import '../database/database_service.dart';
import '../models/study_progress.dart';

class ProgressRepository {
  final DatabaseService db;

  ProgressRepository(this.db);

  Future<StudyStatus> getStatus(int kanjiId) async {
    final result = await db.query(
      'SELECT status FROM study_progress WHERE kanjiId = ? LIMIT 1',
      [kanjiId],
    );
    if (result.rows.isEmpty) return StudyStatus.notStarted;
    return StudyStatus.values.byName(result.rows.first[0] as String);
  }

  Future<void> updateStatus(int kanjiId, StudyStatus status) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await db.execute(
      '''
      INSERT INTO study_progress (kanjiId, status, updatedAt)
      VALUES (?, ?, ?)
      ON CONFLICT(kanjiId) DO UPDATE SET status = ?, updatedAt = ?
      ''',
      [kanjiId, status.name, now, status.name, now],
    );
  }

  Future<Map<StudyStatus, int>> getCountByStatus({int? jlptLevel}) async {
    final levelFilter = jlptLevel != null
        ? 'AND k.jlptLevel = ?'
        : '';
    final params = jlptLevel != null ? [jlptLevel] : <Object?>[];

    // Total kanji count
    final totalResult = await db.query(
      'SELECT COUNT(*) FROM kanji k WHERE 1=1 $levelFilter',
      params,
    );
    final total = totalResult.rows.first[0] as int? ?? 0;

    // Counts by status
    final statusResult = await db.query(
      '''
      SELECT sp.status, COUNT(*) as count
      FROM study_progress sp
      JOIN kanji k ON k.id = sp.kanjiId
      WHERE 1=1 $levelFilter
      GROUP BY sp.status
      ''',
      params,
    );

    final counts = <StudyStatus, int>{
      StudyStatus.notStarted: total,
      StudyStatus.learning: 0,
      StudyStatus.mastered: 0,
    };

    int tracked = 0;
    for (final row in statusResult.rows) {
      final status = StudyStatus.values.byName(row[0] as String);
      final count = row[1] as int;
      counts[status] = count;
      tracked += count;
    }
    counts[StudyStatus.notStarted] = total - tracked;

    return counts;
  }

  Future<int> getMasteredCount({int? jlptLevel}) async {
    final levelFilter = jlptLevel != null
        ? 'AND k.jlptLevel = ?'
        : '';
    final params = <Object?>['mastered'];
    if (jlptLevel != null) params.add(jlptLevel);

    final result = await db.query(
      '''
      SELECT COUNT(*) FROM study_progress sp
      JOIN kanji k ON k.id = sp.kanjiId
      WHERE sp.status = ? $levelFilter
      ''',
      params,
    );
    return result.rows.first[0] as int? ?? 0;
  }

  Future<int> getLearningCount({int? jlptLevel}) async {
    final levelFilter = jlptLevel != null
        ? 'AND k.jlptLevel = ?'
        : '';
    final params = <Object?>['learning'];
    if (jlptLevel != null) params.add(jlptLevel);

    final result = await db.query(
      '''
      SELECT COUNT(*) FROM study_progress sp
      JOIN kanji k ON k.id = sp.kanjiId
      WHERE sp.status = ? $levelFilter
      ''',
      params,
    );
    return result.rows.first[0] as int? ?? 0;
  }
}
