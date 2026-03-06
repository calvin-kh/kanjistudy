import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'database_schema.dart';

/// Result set wrapper
class ResultSet {
  final List<String> columns;
  final List<List<dynamic>> rows;

  ResultSet({required this.columns, required this.rows});
}

/// Database service using sqflite (local only, no sync)
class DatabaseService {
  static DatabaseService? _instance;
  Database? _database;
  bool _isInitialized = false;

  DatabaseService._();

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }

  bool get isInitialized => _isInitialized;

  Database get database {
    if (_database == null) {
      throw StateError('Database not initialized. Call initialize() first.');
    }
    return _database!;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    final dbPath = await _getDbPath();

    _database = await openDatabase(
      dbPath,
      version: DatabaseSchema.version,
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (kDebugMode) {
          print('[DatabaseService] Upgrading DB from v$oldVersion to v$newVersion');
        }
        // Future migrations go here:
        // if (oldVersion < 2) { await _migrateV1toV2(db); }
      },
    );

    _isInitialized = true;

    if (kDebugMode) {
      print('[DatabaseService] Initialized: $dbPath');
    }
  }

  Future<String> _getDbPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return path.join(directory.path, DatabaseSchema.dbName);
  }

  Future<void> _createTables(Database db) async {
    for (final sql in DatabaseSchema.createTableStatements) {
      await db.execute(sql);
    }

    for (final indexSql in DatabaseSchema.createIndexStatements) {
      final statements = indexSql
          .split(';')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty);
      for (final stmt in statements) {
        await db.execute(stmt);
      }
    }

    if (kDebugMode) {
      print('[DatabaseService] Tables and indexes created');
    }
  }

  Future<ResultSet> query(String sql, [List<Object?>? params]) async {
    final List<Map<String, dynamic>> results = await database.rawQuery(
      sql,
      params,
    );

    if (results.isEmpty) {
      return ResultSet(columns: [], rows: []);
    }

    final columns = results.first.keys.toList();
    final rows = results.map((row) => row.values.toList()).toList();

    return ResultSet(columns: columns, rows: rows);
  }

  Future<void> execute(String sql, [List<Object?>? params]) async {
    await database.execute(sql, params);
  }

  Future<void> batch(List<String> statements) async {
    final b = database.batch();
    for (final sql in statements) {
      b.execute(sql);
    }
    await b.commit(noResult: true);
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
    _isInitialized = false;
  }

  Future<void> deleteDatabase() async {
    await close();
    final dbPath = await _getDbPath();
    await databaseFactory.deleteDatabase(dbPath);
  }
}
