import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';
import '../models/kanji.dart';
import '../repositories/favorite_repository.dart';
import '../repositories/kanji_repository.dart';

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  return FavoriteRepository(DatabaseService.instance);
});

/// Set of favorite kanji IDs
final favoriteIdsProvider = StateNotifierProvider<FavoriteIdsNotifier, Set<int>>((ref) {
  return FavoriteIdsNotifier(ref);
});

class FavoriteIdsNotifier extends StateNotifier<Set<int>> {
  final Ref ref;

  FavoriteIdsNotifier(this.ref) : super({}) {
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(favoriteRepositoryProvider);
    final ids = await repo.getAllFavoriteIds();
    state = ids.toSet();
  }

  Future<void> toggle(int kanjiId) async {
    final repo = ref.read(favoriteRepositoryProvider);
    await repo.toggleFavorite(kanjiId);
    if (state.contains(kanjiId)) {
      state = {...state}..remove(kanjiId);
    } else {
      state = {...state, kanjiId};
    }
  }

  bool isFavorite(int kanjiId) => state.contains(kanjiId);
}

/// Favorite kanji list
final favoriteKanjiListProvider = FutureProvider<List<Kanji>>((ref) async {
  final favoriteIds = ref.watch(favoriteIdsProvider);
  if (favoriteIds.isEmpty) return [];

  final kanjiRepo = KanjiRepository(DatabaseService.instance);
  final results = <Kanji>[];
  for (final id in favoriteIds) {
    final kanji = await kanjiRepo.getById(id);
    if (kanji != null) results.add(kanji);
  }
  return results;
});
