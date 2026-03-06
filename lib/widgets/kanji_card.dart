import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config/color_scheme.dart';
import '../config/typography.dart';
import '../config/spacing.dart';
import '../models/kanji.dart';
import 'jlpt_badge.dart';

/// Grid-style kanji card
class KanjiGridCard extends StatelessWidget {
  final Kanji kanji;
  final bool isFavorite;
  final List<int>? kanjiIds;

  const KanjiGridCard({
    super.key,
    required this.kanji,
    this.isFavorite = false,
    this.kanjiIds,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.push('/kanji/${kanji.id}', extra: kanjiIds),
        borderRadius: AppSpacing.borderRadiusLg,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          kanji.character,
                          style: AppTypography.kanjiLarge,
                        ),
                      ),
                    ),
                    AppSpacing.gapXs,
                    Text(
                      kanji.meanings.first,
                      style: AppTypography.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            if (isFavorite)
              const Positioned(
                top: 4,
                right: 4,
                child: Icon(
                  Icons.favorite,
                  size: 14,
                  color: AppColors.error,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// List-style kanji card
class KanjiListCard extends StatelessWidget {
  final Kanji kanji;
  final bool isFavorite;
  final List<int>? kanjiIds;

  const KanjiListCard({
    super.key,
    required this.kanji,
    this.isFavorite = false,
    this.kanjiIds,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => context.push('/kanji/${kanji.id}', extra: kanjiIds),
        leading: SizedBox(
          width: 48,
          child: Center(
            child: Text(kanji.character, style: AppTypography.kanjiMedium),
          ),
        ),
        title: Text(
          kanji.meanings.join(', '),
          style: AppTypography.titleMedium,
        ),
        subtitle: Row(
          children: [
            if (kanji.onyomi != null && kanji.onyomi!.isNotEmpty)
              Text(kanji.onyomi!, style: AppTypography.onyomi.copyWith(fontSize: 12)),
            if (kanji.onyomi != null && kanji.kunyomi != null &&
                kanji.onyomi!.isNotEmpty && kanji.kunyomi!.isNotEmpty)
              const Text(' / '),
            if (kanji.kunyomi != null && kanji.kunyomi!.isNotEmpty)
              Text(kanji.kunyomi!, style: AppTypography.kunyomi.copyWith(fontSize: 12)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isFavorite)
              const Icon(Icons.favorite, size: 16, color: AppColors.error),
            AppSpacing.gapHSm,
            JlptBadge(level: kanji.jlptLevel),
          ],
        ),
      ),
    );
  }
}
