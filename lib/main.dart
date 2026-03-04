import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'database/database_service.dart';
import 'services/data_loader_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  final db = DatabaseService.instance;
  await db.initialize();

  // Load kanji data if not already loaded
  final dataLoader = DataLoaderService(db);
  if (!await dataLoader.isDataLoaded()) {
    await dataLoader.loadAllData();
  }

  runApp(const ProviderScope(child: KanjiStudyApp()));
}
