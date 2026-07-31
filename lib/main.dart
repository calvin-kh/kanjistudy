import 'package:flutter/foundation.dart';
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
  //
  // 동기화 실패(디스크 풀 등)가 runApp까지 전파되면 스플래시에서 영구 멈춤이므로
  // 여기서 흡수한다. 실패해도 기존 데이터로 부팅하고, data_version이 갱신되지
  // 않은 상태라 다음 실행에서 자동으로 재시도된다.
  final dataLoader = DataLoaderService(db);
  try {
    await dataLoader.syncIfNeeded();
  } catch (e) {
    if (kDebugMode) {
      print('[main] Data sync failed, booting with existing data: $e');
    }
  }

  runApp(const ProviderScope(child: KanjiStudyApp()));
}
