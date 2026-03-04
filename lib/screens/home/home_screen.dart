import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';
import '../../providers/kanji_provider.dart';
import '../../providers/stats_provider.dart';
import '../../models/study_progress.dart';
import '../../widgets/jlpt_badge.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiCounts = ref.watch(kanjiCountPerLevelProvider);
    final progress = ref.watch(studyProgressProvider);
    final quizStats = ref.watch(quizStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('한자 학습'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.go('/search'),
          ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          // ─── Quick Stats Card ───
          Card(
            child: Padding(
              padding: AppSpacing.cardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('학습 현황', style: AppTypography.headlineMedium),
                  AppSpacing.gapLg,
                  quizStats.when(
                    data: (stats) => Row(
                      children: [
                        _StatTile(
                          label: '오늘 퀴즈',
                          value: '${stats['todayTotal'] ?? 0}',
                          color: AppColors.primary,
                        ),
                        _StatTile(
                          label: '오늘 정답',
                          value: '${stats['todayCorrect'] ?? 0}',
                          color: AppColors.success,
                        ),
                        _StatTile(
                          label: '전체 퀴즈',
                          value: '${stats['total'] ?? 0}',
                          color: AppColors.info,
                        ),
                      ],
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (_, __) => const Text('통계를 불러올 수 없습니다'),
                  ),
                ],
              ),
            ),
          ),

          AppSpacing.gapLg,

          // ─── Progress Overview ───
          Card(
            child: Padding(
              padding: AppSpacing.cardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('학습 진도', style: AppTypography.headlineMedium),
                  AppSpacing.gapLg,
                  progress.when(
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
                            color: AppColors.primary,
                            minHeight: 8,
                            borderRadius: AppSpacing.borderRadiusFull,
                          ),
                          AppSpacing.gapSm,
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
          ),

          AppSpacing.gapLg,

          // ─── Quick Actions ───
          Text('빠른 실행', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          Row(
            children: [
              Expanded(
                child: _ActionCard(
                  icon: Icons.quiz,
                  label: '퀴즈 시작',
                  color: AppColors.primary,
                  onTap: () => context.go('/quiz'),
                ),
              ),
              AppSpacing.gapHMd,
              Expanded(
                child: _ActionCard(
                  icon: Icons.favorite,
                  label: '즐겨찾기',
                  color: AppColors.error,
                  onTap: () => context.push('/favorites'),
                ),
              ),
              AppSpacing.gapHMd,
              Expanded(
                child: _ActionCard(
                  icon: Icons.bar_chart,
                  label: '통계',
                  color: AppColors.info,
                  onTap: () => context.push('/stats'),
                ),
              ),
            ],
          ),

          AppSpacing.gapXl,

          // ─── JLPT Levels ───
          Text('JLPT 레벨별', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          kanjiCounts.when(
            data: (counts) => Column(
              children: [5, 4, 3, 2, 1].map((level) {
                final count = counts[level] ?? 0;
                return Card(
                  child: ListTile(
                    onTap: () {
                      ref.read(selectedJlptLevelProvider.notifier).state = level;
                      context.go('/kanji');
                    },
                    leading: JlptBadge(level: level, fontSize: 16),
                    title: Text('JLPT N$level'),
                    subtitle: Text('$count 한자'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              }).toList(),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Text('데이터를 불러올 수 없습니다'),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatTile({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: AppTypography.statNumber.copyWith(color: color)),
          AppSpacing.gapXs,
          Text(label, style: AppTypography.caption),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: AppSpacing.borderRadiusLg,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: Column(
            children: [
              Icon(icon, size: 32, color: color),
              AppSpacing.gapSm,
              Text(label, style: AppTypography.label),
            ],
          ),
        ),
      ),
    );
  }
}
