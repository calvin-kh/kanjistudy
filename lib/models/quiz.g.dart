// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      kanjiId: (json['kanjiId'] as num).toInt(),
      character: json['character'] as String,
      type: $enumDecode(_$QuizTypeEnumMap, json['type']),
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswer: json['correctAnswer'] as String,
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'kanjiId': instance.kanjiId,
      'character': instance.character,
      'type': _$QuizTypeEnumMap[instance.type]!,
      'question': instance.question,
      'options': instance.options,
      'correctAnswer': instance.correctAnswer,
    };

const _$QuizTypeEnumMap = {
  QuizType.kanjiToMeaning: 'kanjiToMeaning',
  QuizType.meaningToKanji: 'meaningToKanji',
  QuizType.kanjiToReading: 'kanjiToReading',
};

_QuizItemStats _$QuizItemStatsFromJson(Map<String, dynamic> json) =>
    _QuizItemStats(
      id: (json['id'] as num?)?.toInt(),
      kanjiId: (json['kanjiId'] as num).toInt(),
      quizType: json['quizType'] as String,
      quizCount: (json['quizCount'] as num?)?.toInt() ?? 0,
      correctCount: (json['correctCount'] as num?)?.toInt() ?? 0,
      incorrectCount: (json['incorrectCount'] as num?)?.toInt() ?? 0,
      lastQuizzedAt: json['lastQuizzedAt'] == null
          ? null
          : DateTime.parse(json['lastQuizzedAt'] as String),
      lastCorrectAt: json['lastCorrectAt'] == null
          ? null
          : DateTime.parse(json['lastCorrectAt'] as String),
      lastIncorrectAt: json['lastIncorrectAt'] == null
          ? null
          : DateTime.parse(json['lastIncorrectAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$QuizItemStatsToJson(_QuizItemStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kanjiId': instance.kanjiId,
      'quizType': instance.quizType,
      'quizCount': instance.quizCount,
      'correctCount': instance.correctCount,
      'incorrectCount': instance.incorrectCount,
      'lastQuizzedAt': instance.lastQuizzedAt?.toIso8601String(),
      'lastCorrectAt': instance.lastCorrectAt?.toIso8601String(),
      'lastIncorrectAt': instance.lastIncorrectAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_QuizResult _$QuizResultFromJson(Map<String, dynamic> json) => _QuizResult(
  id: (json['id'] as num?)?.toInt(),
  kanjiId: (json['kanjiId'] as num).toInt(),
  quizType: json['quizType'] as String,
  userAnswer: json['userAnswer'] as String?,
  correctAnswer: json['correctAnswer'] as String?,
  isCorrect: json['isCorrect'] as bool,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$QuizResultToJson(_QuizResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kanjiId': instance.kanjiId,
      'quizType': instance.quizType,
      'userAnswer': instance.userAnswer,
      'correctAnswer': instance.correctAnswer,
      'isCorrect': instance.isCorrect,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_QuizSessionResult _$QuizSessionResultFromJson(Map<String, dynamic> json) =>
    _QuizSessionResult(
      quizType: $enumDecode(_$QuizTypeEnumMap, json['quizType']),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      correctCount: (json['correctCount'] as num).toInt(),
      incorrectCount: (json['incorrectCount'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => QuizAnswerRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizSessionResultToJson(_QuizSessionResult instance) =>
    <String, dynamic>{
      'quizType': _$QuizTypeEnumMap[instance.quizType]!,
      'totalQuestions': instance.totalQuestions,
      'correctCount': instance.correctCount,
      'incorrectCount': instance.incorrectCount,
      'accuracy': instance.accuracy,
      'duration': instance.duration.inMicroseconds,
      'answers': instance.answers,
    };

_QuizAnswerRecord _$QuizAnswerRecordFromJson(Map<String, dynamic> json) =>
    _QuizAnswerRecord(
      kanjiId: (json['kanjiId'] as num).toInt(),
      character: json['character'] as String,
      question: json['question'] as String,
      userAnswer: json['userAnswer'] as String,
      correctAnswer: json['correctAnswer'] as String,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$QuizAnswerRecordToJson(_QuizAnswerRecord instance) =>
    <String, dynamic>{
      'kanjiId': instance.kanjiId,
      'character': instance.character,
      'question': instance.question,
      'userAnswer': instance.userAnswer,
      'correctAnswer': instance.correctAnswer,
      'isCorrect': instance.isCorrect,
    };
