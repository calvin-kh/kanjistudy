import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';

class QuizMenuScreen extends StatelessWidget {
  const QuizMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('퀴즈')),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          Text('퀴즈 유형을 선택하세요', style: AppTypography.headlineMedium),
          AppSpacing.gapLg,
          _QuizTypeCard(
            icon: Icons.translate,
            title: '한자 → 뜻',
            subtitle: '한자를 보고 의미를 고르세요',
            color: AppColors.primary,
            onTap: () => context.push('/quiz/config/kanjiToMeaning'),
          ),
          AppSpacing.gapMd,
          _QuizTypeCard(
            icon: Icons.font_download,
            title: '뜻 → 한자',
            subtitle: '의미를 보고 한자를 고르세요',
            color: AppColors.secondary,
            onTap: () => context.push('/quiz/config/meaningToKanji'),
          ),
          AppSpacing.gapMd,
          _QuizTypeCard(
            icon: Icons.record_voice_over,
            title: '한자 → 읽기',
            subtitle: '한자를 보고 읽기(음독/훈독)를 고르세요',
            color: AppColors.info,
            onTap: () => context.push('/quiz/config/kanjiToReading'),
          ),
        ],
      ),
    );
  }
}

class _QuizTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuizTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
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
          padding: AppSpacing.cardPadding,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: AppSpacing.borderRadiusMd,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              AppSpacing.gapHLg,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.titleMedium),
                    AppSpacing.gapXs,
                    Text(subtitle, style: AppTypography.bodyMedium),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
