import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/spacing.dart';
import '../../providers/favorite_provider.dart';
import '../../widgets/kanji_card.dart';
import '../../widgets/empty_state.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteKanjiListProvider);
    final favoriteIds = ref.watch(favoriteIdsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('즐겨찾기')),
      body: favoritesAsync.when(
        data: (list) {
          if (list.isEmpty) {
            return const EmptyState(
              icon: Icons.favorite_border,
              title: '즐겨찾기가 없습니다',
              subtitle: '한자 상세 화면에서 하트를 눌러 추가하세요',
            );
          }

          return ListView.separated(
            padding: AppSpacing.screenPadding,
            itemCount: list.length,
            separatorBuilder: (_, __) => AppSpacing.gapSm,
            itemBuilder: (context, index) {
              final kanji = list[index];
              return KanjiListCard(
                kanji: kanji,
                isFavorite: favoriteIds.contains(kanji.id),
                kanjiIds: list.map((k) => k.id!).toList(),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('오류: $e')),
      ),
    );
  }
}
