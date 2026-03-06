import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';
import '../models/kanji.dart';
import '../repositories/kanji_repository.dart';

final kanjiRepositoryProvider = Provider<KanjiRepository>((ref) {
  return KanjiRepository(DatabaseService.instance);
});

/// Selected JLPT level for browsing
final selectedJlptLevelProvider = StateProvider<int>((ref) => 5);

/// Kanji list by level
final kanjiListProvider = FutureProvider.family<List<Kanji>, int>((ref, level) async {
  final repo = ref.watch(kanjiRepositoryProvider);
  return repo.getByLevel(level);
});

/// Kanji detail by ID
final kanjiDetailProvider = FutureProvider.autoDispose.family<Kanji?, int>((ref, id) async {
  final repo = ref.watch(kanjiRepositoryProvider);
  return repo.getById(id);
});

/// Kanji count per level
final kanjiCountPerLevelProvider = FutureProvider<Map<int, int>>((ref) async {
  final repo = ref.watch(kanjiRepositoryProvider);
  return repo.countPerLevel();
});

/// Total kanji count
final kanjiTotalCountProvider = FutureProvider<int>((ref) async {
  final repo = ref.watch(kanjiRepositoryProvider);
  return repo.countAll();
});

/// Search results
final kanjiSearchQueryProvider = StateProvider<String>((ref) => '');

final kanjiSearchResultsProvider = FutureProvider<List<Kanji>>((ref) async {
  final query = ref.watch(kanjiSearchQueryProvider);
  if (query.isEmpty) return [];
  final repo = ref.watch(kanjiRepositoryProvider);
  return repo.search(query);
});
