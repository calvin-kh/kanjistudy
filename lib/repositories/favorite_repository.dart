import '../database/database_service.dart';

class FavoriteRepository {
  final DatabaseService db;

  FavoriteRepository(this.db);

  Future<bool> isFavorite(int kanjiId) async {
    final result = await db.query(
      'SELECT 1 FROM favorites WHERE kanjiId = ? LIMIT 1',
      [kanjiId],
    );
    return result.rows.isNotEmpty;
  }

  Future<void> addFavorite(int kanjiId) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await db.execute(
      'INSERT OR IGNORE INTO favorites (kanjiId, createdAt) VALUES (?, ?)',
      [kanjiId, now],
    );
  }

  Future<void> removeFavorite(int kanjiId) async {
    await db.execute(
      'DELETE FROM favorites WHERE kanjiId = ?',
      [kanjiId],
    );
  }

  Future<void> toggleFavorite(int kanjiId) async {
    if (await isFavorite(kanjiId)) {
      await removeFavorite(kanjiId);
    } else {
      await addFavorite(kanjiId);
    }
  }

  Future<List<int>> getAllFavoriteIds() async {
    final result = await db.query(
      'SELECT kanjiId FROM favorites ORDER BY createdAt DESC',
    );
    return result.rows.map((r) => r[0] as int).toList();
  }

  Future<int> count() async {
    final result = await db.query('SELECT COUNT(*) FROM favorites');
    return result.rows.first[0] as int? ?? 0;
  }
}
