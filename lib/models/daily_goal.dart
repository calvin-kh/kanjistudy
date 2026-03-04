import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_goal.freezed.dart';
part 'daily_goal.g.dart';

@freezed
sealed class DailyGoal with _$DailyGoal {
  const factory DailyGoal({
    int? id,
    required String date,
    @Default(10) int targetCount,
    @Default(0) int studiedCount,
    @Default(0) int quizCount,
    @Default(0) int correctCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DailyGoal;

  factory DailyGoal.fromJson(Map<String, dynamic> json) => _$DailyGoalFromJson(json);
}
