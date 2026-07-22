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

  // 최초 설치는 전체 적재, 기존 설치는 데이터 버전이 바뀐 경우에만 재동기화.
  // 사용자 데이터(즐겨찾기/진도/퀴즈통계)는 kanji.id를 보존하는 방식이라 승계된다.
  final dataLoader = DataLoaderService(db);
  await dataLoader.syncIfNeeded();

  runApp(const ProviderScope(child: KanjiStudyApp()));
}
