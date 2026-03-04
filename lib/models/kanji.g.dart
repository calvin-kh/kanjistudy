// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Kanji _$KanjiFromJson(Map<String, dynamic> json) => _Kanji(
  id: (json['id'] as num?)?.toInt(),
  character: json['character'] as String,
  onyomi: json['onyomi'] as String?,
  kunyomi: json['kunyomi'] as String?,
  meanings: (json['meanings'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  strokeCount: (json['strokeCount'] as num?)?.toInt(),
  jlptLevel: (json['jlptLevel'] as num).toInt(),
  grade: (json['grade'] as num?)?.toInt(),
  examples:
      (json['examples'] as List<dynamic>?)
          ?.map((e) => KanjiExample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$KanjiToJson(_Kanji instance) => <String, dynamic>{
  'id': instance.id,
  'character': instance.character,
  'onyomi': instance.onyomi,
  'kunyomi': instance.kunyomi,
  'meanings': instance.meanings,
  'strokeCount': instance.strokeCount,
  'jlptLevel': instance.jlptLevel,
  'grade': instance.grade,
  'examples': instance.examples,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_KanjiExample _$KanjiExampleFromJson(Map<String, dynamic> json) =>
    _KanjiExample(
      word: json['word'] as String,
      reading: json['reading'] as String?,
      meaning: json['meaning'] as String?,
    );

Map<String, dynamic> _$KanjiExampleToJson(_KanjiExample instance) =>
    <String, dynamic>{
      'word': instance.word,
      'reading': instance.reading,
      'meaning': instance.meaning,
    };
