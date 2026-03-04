import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanji.freezed.dart';
part 'kanji.g.dart';

@freezed
sealed class Kanji with _$Kanji {
  const factory Kanji({
    int? id,
    required String character,
    String? onyomi,
    String? kunyomi,
    required List<String> meanings,
    int? strokeCount,
    required int jlptLevel,
    int? grade,
    @Default([]) List<KanjiExample> examples,
    DateTime? createdAt,
  }) = _Kanji;

  factory Kanji.fromJson(Map<String, dynamic> json) => _$KanjiFromJson(json);
}

@freezed
sealed class KanjiExample with _$KanjiExample {
  const factory KanjiExample({
    required String word,
    String? reading,
    String? meaning,
  }) = _KanjiExample;

  factory KanjiExample.fromJson(Map<String, dynamic> json) => _$KanjiExampleFromJson(json);
}
