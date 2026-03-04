import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';
import '../../providers/stats_provider.dart';
import '../../providers/kanji_provider.dart';
import '../../models/study_progress.dart';
import '../../widgets/jlpt_badge.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizStats = ref.watch(quizStatsProvider);
    final kanjiCounts = ref.watch(kanjiCountPerLevelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('학습 통계')),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          // ─── Quiz Stats ───
          Text('퀴즈 통계', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          quizStats.when(
            data: (stats) {
              final total = stats['total'] ?? 0;
              final correct = stats['correct'] ?? 0;
              final accuracy = total > 0 ? (correct / total * 100).toInt() : 0;

              return Card(
                child: Padding(
                  padding: AppSpacing.cardPadding,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _StatTile('전체', '$total', AppColors.primary),
                          _StatTile('정답', '$correct', AppColors.success),
                          _StatTile('정답률', '$accuracy%', AppColors.info),
                        ],
                      ),
                      AppSpacing.gapLg,
                      const Divider(),
                      AppSpacing.gapSm,
                      Row(
                        children: [
                          _StatTile('오늘 퀴즈', '${stats['todayTotal'] ?? 0}', AppColors.primary),
                          _StatTile('오늘 정답', '${stats['todayCorrect'] ?? 0}', AppColors.success),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Card(child: Center(child: CircularProgressIndicator())),
            error: (_, __) => const SizedBox.shrink(),
          ),

          AppSpacing.gapXl,

          // ─── Progress by Level ───
          Text('레벨별 진도', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          ...([5, 4, 3, 2, 1].map((level) {
            final levelProgress = ref.watch(studyProgressByLevelProvider(level));
            final levelCount = kanjiCounts.whenData((c) => c[level] ?? 0);

            return Card(
              child: Padding(
                padding: AppSpacing.cardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        JlptBadge(level: level),
                        AppSpacing.gapHSm,
                        levelCount.when(
                          data: (count) => Text('$count자', style: AppTypography.bodyMedium),
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                    AppSpacing.gapSm,
                    levelProgress.when(
                      data: (counts) {
                        final mastered = counts[StudyStatus.mastered] ?? 0;
                        final learning = counts[StudyStatus.learning] ?? 0;
                        final notStarted = counts[StudyStatus.notStarted] ?? 0;
                        final total = mastered + learning + notStarted;
                        final progressValue = total > 0 ? mastered / total : 0.0;

                        return Column(
                          children: [
                            LinearProgressIndicator(
                              value: progressValue,
                              backgroundColor: AppColors.border,
                              color: AppColors.jlptColor(level),
                              minHeight: 6,
                              borderRadius: AppSpacing.borderRadiusFull,
                            ),
                            AppSpacing.gapXs,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('완료 $mastered', style: AppTypography.caption),
                                Text('학습중 $learning', style: AppTypography.caption),
                                Text('미학습 $notStarted', style: AppTypography.caption),
                              ],
                            ),
                          ],
                        );
                      },
                      loading: () => const LinearProgressIndicator(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            );
          })),

          AppSpacing.gapXxl,
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatTile(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: AppTypography.statNumber.copyWith(color: color, fontSize: 24)),
          AppSpacing.gapXs,
          Text(label, style: AppTypography.caption),
        ],
      ),
    );
  }
}
