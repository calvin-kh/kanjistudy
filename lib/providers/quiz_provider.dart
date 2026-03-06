import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';
import '../models/kanji.dart';
import '../models/quiz.dart';
import '../repositories/kanji_repository.dart';
import '../repositories/quiz_repository.dart';
import 'kanji_provider.dart';

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  return QuizRepository(DatabaseService.instance);
});

/// Quiz session state
class QuizSessionState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final List<QuizAnswerRecord> answers;
  final DateTime startTime;
  final bool isFinished;

  const QuizSessionState({
    required this.questions,
    this.currentIndex = 0,
    this.answers = const [],
    required this.startTime,
    this.isFinished = false,
  });

  QuizQuestion get currentQuestion => questions[currentIndex];
  int get totalQuestions => questions.length;
  bool get hasNext => currentIndex < questions.length - 1;
  double get progress => totalQuestions > 0 ? (currentIndex + 1) / totalQuestions : 0;
}

final quizSessionProvider =
    StateNotifierProvider<QuizSessionNotifier, QuizSessionState?>((ref) {
  return QuizSessionNotifier(ref);
});

class QuizSessionNotifier extends StateNotifier<QuizSessionState?> {
  final Ref ref;
  final _random = Random();

  QuizSessionNotifier(this.ref) : super(null);

  /// Start a new quiz session
  Future<void> startQuiz({
    required QuizType quizType,
    int? jlptLevel,
    int questionCount = 10,
  }) async {
    final kanjiRepo = ref.read(kanjiRepositoryProvider);
    final quizRepo = ref.read(quizRepositoryProvider);

    // Get priority kanji IDs
    final priorityIds = await quizRepo.getPriorityKanjiIds(
      quizType.name,
      jlptLevel: jlptLevel,
      limit: questionCount,
    );

    if (priorityIds.isEmpty) return;

    // Build questions
    final questions = <QuizQuestion>[];
    for (final kanjiId in priorityIds) {
      final kanji = await kanjiRepo.getById(kanjiId);
      if (kanji == null) continue;

      final question = await _buildQuestion(kanji, quizType, kanjiRepo, jlptLevel);
      if (question != null) questions.add(question);
    }

    if (questions.isEmpty) return;

    state = QuizSessionState(
      questions: questions,
      startTime: DateTime.now(),
    );
  }

  /// Answer current question
  Future<void> answer(String userAnswer) async {
    if (state == null || state!.isFinished) return;

    final question = state!.currentQuestion;
    final isCorrect = userAnswer == question.correctAnswer;

    // Save to DB
    final quizRepo = ref.read(quizRepositoryProvider);
    await quizRepo.updateItemStats(question.kanjiId, question.type.name, isCorrect);
    await quizRepo.saveResult(QuizResult(
      kanjiId: question.kanjiId,
      quizType: question.type.name,
      userAnswer: userAnswer,
      correctAnswer: question.correctAnswer,
      isCorrect: isCorrect,
    ));

    final record = QuizAnswerRecord(
      kanjiId: question.kanjiId,
      character: question.character,
      question: question.question,
      userAnswer: userAnswer,
      correctAnswer: question.correctAnswer,
      isCorrect: isCorrect,
    );

    final newAnswers = [...state!.answers, record];
    final isLast = !state!.hasNext;

    state = QuizSessionState(
      questions: state!.questions,
      currentIndex: isLast ? state!.currentIndex : state!.currentIndex + 1,
      answers: newAnswers,
      startTime: state!.startTime,
      isFinished: isLast,
    );
  }

  /// Get session result
  QuizSessionResult? getResult() {
    if (state == null || !state!.isFinished) return null;

    final correctCount = state!.answers.where((a) => a.isCorrect).length;
    return QuizSessionResult(
      quizType: state!.questions.first.type,
      totalQuestions: state!.answers.length,
      correctCount: correctCount,
      incorrectCount: state!.answers.length - correctCount,
      accuracy: state!.answers.isNotEmpty ? correctCount / state!.answers.length : 0,
      duration: DateTime.now().difference(state!.startTime),
      answers: state!.answers,
    );
  }

  void reset() {
    state = null;
  }

  // ─── Question Builders ───

  Future<QuizQuestion?> _buildQuestion(
    Kanji kanji,
    QuizType type,
    KanjiRepository kanjiRepo,
    int? jlptLevel,
  ) async {
    switch (type) {
      case QuizType.kanjiToMeaning:
        return _buildKanjiToMeaning(kanji, kanjiRepo, jlptLevel);
      case QuizType.meaningToKanji:
        return _buildMeaningToKanji(kanji, kanjiRepo, jlptLevel);
      case QuizType.kanjiToReading:
        return _buildKanjiToReading(kanji, kanjiRepo, jlptLevel);
    }
  }

  Future<QuizQuestion?> _buildKanjiToMeaning(
    Kanji kanji,
    KanjiRepository kanjiRepo,
    int? jlptLevel,
  ) async {
    final correctAnswer = kanji.meanings.join(', ');
    final distractors = await _getDistractorMeanings(kanji, kanjiRepo, jlptLevel);
    if (distractors.length < 3) return null;

    final options = [correctAnswer, ...distractors.take(3)]..shuffle(_random);

    return QuizQuestion(
      kanjiId: kanji.id!,
      character: kanji.character,
      type: QuizType.kanjiToMeaning,
      question: kanji.character,
      options: options,
      correctAnswer: correctAnswer,
    );
  }

  Future<QuizQuestion?> _buildMeaningToKanji(
    Kanji kanji,
    KanjiRepository kanjiRepo,
    int? jlptLevel,
  ) async {
    final correctAnswer = kanji.character;
    final distractors = await kanjiRepo.getRandomForQuiz(
      jlptLevel: jlptLevel,
      limit: 3,
      excludeIds: [kanji.id!],
    );
    if (distractors.length < 3) return null;

    final options = [
      correctAnswer,
      ...distractors.map((k) => k.character),
    ]..shuffle(_random);

    return QuizQuestion(
      kanjiId: kanji.id!,
      character: kanji.character,
      type: QuizType.meaningToKanji,
      question: kanji.meanings.join(', '),
      options: options,
      correctAnswer: correctAnswer,
    );
  }

  Future<QuizQuestion?> _buildKanjiToReading(
    Kanji kanji,
    KanjiRepository kanjiRepo,
    int? jlptLevel,
  ) async {
    // Use onyomi or kunyomi as correct answer
    final readings = <String>[];
    if (kanji.onyomi != null && kanji.onyomi!.isNotEmpty) {
      readings.add(kanji.onyomi!);
    }
    if (kanji.kunyomi != null && kanji.kunyomi!.isNotEmpty) {
      readings.add(kanji.kunyomi!);
    }
    if (readings.isEmpty) return null;

    final correctAnswer = readings.first;
    final distractors = await _getDistractorReadings(kanji, kanjiRepo, jlptLevel);
    if (distractors.length < 3) return null;

    final options = [correctAnswer, ...distractors.take(3)]..shuffle(_random);

    return QuizQuestion(
      kanjiId: kanji.id!,
      character: kanji.character,
      type: QuizType.kanjiToReading,
      question: kanji.character,
      options: options,
      correctAnswer: correctAnswer,
    );
  }

  Future<List<String>> _getDistractorMeanings(
    Kanji kanji,
    KanjiRepository kanjiRepo,
    int? jlptLevel,
  ) async {
    final others = await kanjiRepo.getRandomForQuiz(
      jlptLevel: jlptLevel,
      limit: 3,
      excludeIds: [kanji.id!],
    );
    return others.map((k) => k.meanings.join(', ')).toList();
  }

  Future<List<String>> _getDistractorReadings(
    Kanji kanji,
    KanjiRepository kanjiRepo,
    int? jlptLevel,
  ) async {
    final others = await kanjiRepo.getRandomForQuiz(
      jlptLevel: jlptLevel,
      limit: 3,
      excludeIds: [kanji.id!],
    );
    return others.map((k) {
      if (k.onyomi != null && k.onyomi!.isNotEmpty) return k.onyomi!;
      if (k.kunyomi != null && k.kunyomi!.isNotEmpty) return k.kunyomi!;
      return '---';
    }).toList();
  }
}
