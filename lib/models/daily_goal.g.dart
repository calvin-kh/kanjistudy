// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyGoal _$DailyGoalFromJson(Map<String, dynamic> json) => _DailyGoal(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String,
  targetCount: (json['targetCount'] as num?)?.toInt() ?? 10,
  studiedCount: (json['studiedCount'] as num?)?.toInt() ?? 0,
  quizCount: (json['quizCount'] as num?)?.toInt() ?? 0,
  correctCount: (json['correctCount'] as num?)?.toInt() ?? 0,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DailyGoalToJson(_DailyGoal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'targetCount': instance.targetCount,
      'studiedCount': instance.studiedCount,
      'quizCount': instance.quizCount,
      'correctCount': instance.correctCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
