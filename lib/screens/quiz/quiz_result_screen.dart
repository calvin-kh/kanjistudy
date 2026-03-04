import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';
import '../../models/quiz.dart';

class QuizResultScreen extends StatelessWidget {
  final QuizSessionResult sessionResult;

  const QuizResultScreen({super.key, required this.sessionResult});

  @override
  Widget build(BuildContext context) {
    final accuracy = (sessionResult.accuracy * 100).toInt();
    final isGood = accuracy >= 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('퀴즈 결과'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/quiz'),
        ),
      ),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          // ─── Score ───
          Center(
            child: Column(
              children: [
                Icon(
                  isGood ? Icons.celebration : Icons.sentiment_dissatisfied,
                  size: 64,
                  color: isGood ? AppColors.success : AppColors.warning,
                ),
                AppSpacing.gapLg,
                Text(
                  '$accuracy%',
                  style: AppTypography.statNumber.copyWith(
                    fontSize: 48,
                    color: isGood ? AppColors.success : AppColors.warning,
                  ),
                ),
                AppSpacing.gapSm,
                Text(
                  isGood ? '잘했습니다!' : '더 노력해봐요!',
                  style: AppTypography.headlineLarge,
                ),
              ],
            ),
          ),

          AppSpacing.gapXl,

          // ─── Summary ───
          Row(
            children: [
              _ResultTile(
                label: '전체',
                value: '${sessionResult.totalQuestions}',
                color: AppColors.primary,
              ),
              _ResultTile(
                label: '정답',
                value: '${sessionResult.correctCount}',
                color: AppColors.success,
              ),
              _ResultTile(
                label: '오답',
                value: '${sessionResult.incorrectCount}',
                color: AppColors.error,
              ),
              _ResultTile(
                label: '소요시간',
                value: _formatDuration(sessionResult.duration),
                color: AppColors.info,
              ),
            ],
          ),

          AppSpacing.gapXl,

          // ─── Answer Details ───
          Text('상세 결과', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          ...sessionResult.answers.map((answer) {
            return Card(
              child: ListTile(
                leading: Icon(
                  answer.isCorrect ? Icons.check_circle : Icons.cancel,
                  color: answer.isCorrect ? AppColors.success : AppColors.error,
                ),
                title: Text(answer.character, style: AppTypography.kanjiMedium),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!answer.isCorrect) ...[
                      Text(
                        '내 답: ${answer.userAnswer}',
                        style: TextStyle(color: AppColors.error),
                      ),
                    ],
                    Text('정답: ${answer.correctAnswer}'),
                  ],
                ),
              ),
            );
          }),

          AppSpacing.gapXl,

          // ─── Actions ───
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.go('/quiz'),
                  child: const Text('퀴즈 메뉴'),
                ),
              ),
              AppSpacing.gapHMd,
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('홈으로'),
                ),
              ),
            ],
          ),

          AppSpacing.gapXxl,
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    if (minutes > 0) return '$minutes분 $seconds초';
    return '$seconds초';
  }
}

class _ResultTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ResultTile({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: AppTypography.headlineLarge.copyWith(color: color),
          ),
          AppSpacing.gapXs,
          Text(label, style: AppTypography.caption),
        ],
      ),
    );
  }
}
