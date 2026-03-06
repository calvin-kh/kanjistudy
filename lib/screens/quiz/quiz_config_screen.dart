import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';

class QuizConfigScreen extends ConsumerStatefulWidget {
  final String quizType;

  const QuizConfigScreen({super.key, required this.quizType});

  @override
  ConsumerState<QuizConfigScreen> createState() => _QuizConfigScreenState();
}

class _QuizConfigScreenState extends ConsumerState<QuizConfigScreen> {
  int? _selectedLevel; // null = all levels
  int _questionCount = 10;

  String get _quizTitle {
    switch (widget.quizType) {
      case 'kanjiToMeaning': return '한자 → 뜻';
      case 'meaningToKanji': return '뜻 → 한자';
      case 'kanjiToReading': return '한자 → 읽기';
      default: return '퀴즈';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$_quizTitle 설정')),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: AppSpacing.screenPadding,
          children: [
          // JLPT Level Selection
          Text('JLPT 레벨', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              ChoiceChip(
                label: const Text('전체'),
                selected: _selectedLevel == null,
                onSelected: (_) => setState(() => _selectedLevel = null),
              ),
              ...[5, 4, 3, 2, 1].map((level) {
                return ChoiceChip(
                  label: Text('N$level'),
                  selected: _selectedLevel == level,
                  selectedColor: AppColors.jlptColor(level).withValues(alpha: 0.2),
                  onSelected: (_) => setState(() => _selectedLevel = level),
                );
              }),
            ],
          ),

          AppSpacing.gapXl,

          // Question Count
          Text('문제 수', style: AppTypography.headlineMedium),
          AppSpacing.gapSm,
          Wrap(
            spacing: AppSpacing.sm,
            children: [5, 10, 20, 30].map((count) {
              return ChoiceChip(
                label: Text('$count문제'),
                selected: _questionCount == count,
                onSelected: (_) => setState(() => _questionCount = count),
              );
            }).toList(),
          ),

          AppSpacing.gapXxl,

          // Start Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.push(
                  '/quiz/play/${widget.quizType}',
                  extra: {
                    'jlptLevel': _selectedLevel,
                    'questionCount': _questionCount,
                  },
                );
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('퀴즈 시작'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
