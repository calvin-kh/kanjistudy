import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';
import '../../providers/kanji_provider.dart';
import '../../providers/favorite_provider.dart';
import '../../providers/settings_provider.dart';
import '../../widgets/kanji_card.dart';
import '../../widgets/jlpt_badge.dart';

class KanjiListScreen extends ConsumerWidget {
  const KanjiListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLevel = ref.watch(selectedJlptLevelProvider);
    final kanjiList = ref.watch(kanjiListProvider(selectedLevel));
    final favoriteIds = ref.watch(favoriteIdsProvider);
    final displayMode = ref.watch(kanjiDisplayModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('한자'),
        actions: [
          IconButton(
            icon: Icon(
              displayMode == KanjiDisplayMode.grid
                  ? Icons.view_list
                  : Icons.grid_view,
            ),
            onPressed: () {
              ref.read(kanjiDisplayModeProvider.notifier).state =
                  displayMode == KanjiDisplayMode.grid
                      ? KanjiDisplayMode.list
                      : KanjiDisplayMode.grid;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // JLPT Level Tabs
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              children: [5, 4, 3, 2, 1].map((level) {
                final isSelected = selectedLevel == level;
                final color = AppColors.jlptColor(level);
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    selected: isSelected,
                    label: Text('N$level'),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : color,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: color.withValues(alpha: 0.1),
                    selectedColor: color,
                    checkmarkColor: Colors.white,
                    onSelected: (_) {
                      ref.read(selectedJlptLevelProvider.notifier).state = level;
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          AppSpacing.gapSm,

          // Kanji Count
          kanjiList.when(
            data: (list) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                children: [
                  JlptBadge(level: selectedLevel),
                  AppSpacing.gapHSm,
                  Text('${list.length}자', style: AppTypography.bodyMedium),
                ],
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          AppSpacing.gapSm,

          // Kanji Grid/List
          Expanded(
            child: kanjiList.when(
              data: (list) {
                if (list.isEmpty) {
                  return Center(
                    child: Text('데이터가 없습니다', style: AppTypography.bodyMedium),
                  );
                }

                if (displayMode == KanjiDisplayMode.grid) {
                  return GridView.builder(
                    padding: AppSpacing.screenPadding,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: AppSpacing.sm,
                      mainAxisSpacing: AppSpacing.sm,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final kanji = list[index];
                      return KanjiGridCard(
                        kanji: kanji,
                        isFavorite: favoriteIds.contains(kanji.id),
                      );
                    },
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
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('오류: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
