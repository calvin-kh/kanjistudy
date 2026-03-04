import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_progress.freezed.dart';
part 'study_progress.g.dart';

enum StudyStatus {
  notStarted,
  learning,
  mastered,
}

@freezed
sealed class StudyProgress with _$StudyProgress {
  const factory StudyProgress({
    int? id,
    required int kanjiId,
    @Default(StudyStatus.notStarted) StudyStatus status,
    DateTime? updatedAt,
  }) = _StudyProgress;

  factory StudyProgress.fromJson(Map<String, dynamic> json) => _$StudyProgressFromJson(json);
}
