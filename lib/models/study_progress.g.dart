// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudyProgress _$StudyProgressFromJson(Map<String, dynamic> json) =>
    _StudyProgress(
      id: (json['id'] as num?)?.toInt(),
      kanjiId: (json['kanjiId'] as num).toInt(),
      status:
          $enumDecodeNullable(_$StudyStatusEnumMap, json['status']) ??
          StudyStatus.notStarted,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$StudyProgressToJson(_StudyProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kanjiId': instance.kanjiId,
      'status': _$StudyStatusEnumMap[instance.status]!,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$StudyStatusEnumMap = {
  StudyStatus.notStarted: 'notStarted',
  StudyStatus.learning: 'learning',
  StudyStatus.mastered: 'mastered',
};
