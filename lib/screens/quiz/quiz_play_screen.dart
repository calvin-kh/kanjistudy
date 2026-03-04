import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';

class QuizPlayScreen extends ConsumerStatefulWidget {
  final String quizType;
  final int? jlptLevel;
  final int questionCount;

  const QuizPlayScreen({
    super.key,
    required this.quizType,
    this.jlptLevel,
    this.questionCount = 10,
  });

  @override
  ConsumerState<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends ConsumerState<QuizPlayScreen> {
  bool _initialized = false;
  String? _selectedAnswer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _startQuiz();
  }

  Future<void> _startQuiz() async {
    final quizType = QuizType.values.byName(widget.quizType);
    await ref.read(quizSessionProvider.notifier).startQuiz(
      quizType: quizType,
      jlptLevel: widget.jlptLevel,
      questionCount: widget.questionCount,
    );
    if (mounted) setState(() => _initialized = true);
  }

  void _selectAnswer(String answer) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = answer;
      _answered = true;
    });
    ref.read(quizSessionProvider.notifier).answer(answer);
  }

  void _next() {
    final session = ref.read(quizSessionProvider);
    if (session == null) return;

    if (session.isFinished) {
      final result = ref.read(quizSessionProvider.notifier).getResult();
      if (result != null) {
        ref.read(quizSessionProvider.notifier).reset();
        context.pushReplacement('/quiz/result', extra: {'result': result});
      }
    } else {
      setState(() {
        _selectedAnswer = null;
        _answered = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(quizSessionProvider);

    if (!_initialized || session == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('퀴즈')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (session.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('퀴즈')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('퀴즈 문제를 만들 수 없습니다'),
              AppSpacing.gapLg,
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('돌아가기'),
              ),
            ],
          ),
        ),
      );
    }

    final question = _answered
        ? session.questions[session.currentIndex - (session.isFinished ? 0 : 1)]
        : session.currentQuestion;
    final isCorrect = _selectedAnswer == question.correctAnswer;

    return Scaffold(
      appBar: AppBar(
        title: Text('${session.currentIndex + (_answered && !session.isFinished ? 0 : 0)}/${session.totalQuestions}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: session.progress,
            backgroundColor: AppColors.border,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          children: [
            const Spacer(),

            // Question
            Text(
              _getQuestionLabel(question.type),
              style: AppTypography.bodyMedium,
            ),
            AppSpacing.gapMd,
            Text(
              question.question,
              style: question.type == QuizType.meaningToKanji
                  ? AppTypography.headlineLarge
                  : AppTypography.kanjiHero,
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // Options
            ...question.options.map((option) {
              Color? bgColor;
              Color? borderColor;

              if (_answered) {
                if (option == question.correctAnswer) {
                  bgColor = AppColors.success.withValues(alpha: 0.1);
                  borderColor = AppColors.success;
                } else if (option == _selectedAnswer && !isCorrect) {
                  bgColor = AppColors.error.withValues(alpha: 0.1);
                  borderColor = AppColors.error;
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _answered ? null : () => _selectAnswer(option),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: bgColor,
                      side: borderColor != null
                          ? BorderSide(color: borderColor, width: 2)
                          : null,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: question.type == QuizType.meaningToKanji ? 28 : 16,
                      ),
                    ),
                  ),
                ),
              );
            }),

            AppSpacing.gapLg,

            // Next / Result button
            if (_answered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: Text(
                    session.isFinished ? '결과 보기' : '다음',
                  ),
                ),
              ),

            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }

  String _getQuestionLabel(QuizType type) {
    switch (type) {
      case QuizType.kanjiToMeaning: return '이 한자의 뜻은?';
      case QuizType.meaningToKanji: return '이 뜻의 한자는?';
      case QuizType.kanjiToReading: return '이 한자의 읽기는?';
    }
  }
}
