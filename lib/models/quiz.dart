import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

enum QuizType {
  kanjiToMeaning,   // 한자→뜻
  meaningToKanji,   // 뜻→한자
  kanjiToReading,   // 한자→읽기
}

@freezed
sealed class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required int kanjiId,
    required String character,
    required QuizType type,
    required String question,
    required List<String> options,
    required String correctAnswer,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);
}

@freezed
sealed class QuizItemStats with _$QuizItemStats {
  const factory QuizItemStats({
    int? id,
    required int kanjiId,
    required String quizType,
    @Default(0) int quizCount,
    @Default(0) int correctCount,
    @Default(0) int incorrectCount,
    DateTime? lastQuizzedAt,
    DateTime? lastCorrectAt,
    DateTime? lastIncorrectAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _QuizItemStats;

  factory QuizItemStats.fromJson(Map<String, dynamic> json) => _$QuizItemStatsFromJson(json);
}

@freezed
sealed class QuizResult with _$QuizResult {
  const factory QuizResult({
    int? id,
    required int kanjiId,
    required String quizType,
    String? userAnswer,
    String? correctAnswer,
    required bool isCorrect,
    DateTime? createdAt,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);
}

@freezed
sealed class QuizSessionResult with _$QuizSessionResult {
  const factory QuizSessionResult({
    required QuizType quizType,
    required int totalQuestions,
    required int correctCount,
    required int incorrectCount,
    required double accuracy,
    required Duration duration,
    required List<QuizAnswerRecord> answers,
  }) = _QuizSessionResult;

  factory QuizSessionResult.fromJson(Map<String, dynamic> json) => _$QuizSessionResultFromJson(json);
}

@freezed
sealed class QuizAnswerRecord with _$QuizAnswerRecord {
  const factory QuizAnswerRecord({
    required int kanjiId,
    required String character,
    required String question,
    required String userAnswer,
    required String correctAnswer,
    required bool isCorrect,
  }) = _QuizAnswerRecord;

  factory QuizAnswerRecord.fromJson(Map<String, dynamic> json) => _$QuizAnswerRecordFromJson(json);
}
