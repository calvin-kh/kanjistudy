// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kanji.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Kanji {

 int? get id; String get character; String? get onyomi; String? get kunyomi; List<String> get meanings; int? get strokeCount; int get jlptLevel; int? get grade; List<KanjiExample> get examples; DateTime? get createdAt;
/// Create a copy of Kanji
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KanjiCopyWith<Kanji> get copyWith => _$KanjiCopyWithImpl<Kanji>(this as Kanji, _$identity);

  /// Serializes this Kanji to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Kanji&&(identical(other.id, id) || other.id == id)&&(identical(other.character, character) || other.character == character)&&(identical(other.onyomi, onyomi) || other.onyomi == onyomi)&&(identical(other.kunyomi, kunyomi) || other.kunyomi == kunyomi)&&const DeepCollectionEquality().equals(other.meanings, meanings)&&(identical(other.strokeCount, strokeCount) || other.strokeCount == strokeCount)&&(identical(other.jlptLevel, jlptLevel) || other.jlptLevel == jlptLevel)&&(identical(other.grade, grade) || other.grade == grade)&&const DeepCollectionEquality().equals(other.examples, examples)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,character,onyomi,kunyomi,const DeepCollectionEquality().hash(meanings),strokeCount,jlptLevel,grade,const DeepCollectionEquality().hash(examples),createdAt);

@override
String toString() {
  return 'Kanji(id: $id, character: $character, onyomi: $onyomi, kunyomi: $kunyomi, meanings: $meanings, strokeCount: $strokeCount, jlptLevel: $jlptLevel, grade: $grade, examples: $examples, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $KanjiCopyWith<$Res>  {
  factory $KanjiCopyWith(Kanji value, $Res Function(Kanji) _then) = _$KanjiCopyWithImpl;
@useResult
$Res call({
 int? id, String character, String? onyomi, String? kunyomi, List<String> meanings, int? strokeCount, int jlptLevel, int? grade, List<KanjiExample> examples, DateTime? createdAt
});




}
/// @nodoc
class _$KanjiCopyWithImpl<$Res>
    implements $KanjiCopyWith<$Res> {
  _$KanjiCopyWithImpl(this._self, this._then);

  final Kanji _self;
  final $Res Function(Kanji) _then;

/// Create a copy of Kanji
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? character = null,Object? onyomi = freezed,Object? kunyomi = freezed,Object? meanings = null,Object? strokeCount = freezed,Object? jlptLevel = null,Object? grade = freezed,Object? examples = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,onyomi: freezed == onyomi ? _self.onyomi : onyomi // ignore: cast_nullable_to_non_nullable
as String?,kunyomi: freezed == kunyomi ? _self.kunyomi : kunyomi // ignore: cast_nullable_to_non_nullable
as String?,meanings: null == meanings ? _self.meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<String>,strokeCount: freezed == strokeCount ? _self.strokeCount : strokeCount // ignore: cast_nullable_to_non_nullable
as int?,jlptLevel: null == jlptLevel ? _self.jlptLevel : jlptLevel // ignore: cast_nullable_to_non_nullable
as int,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<KanjiExample>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Kanji].
extension KanjiPatterns on Kanji {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Kanji value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Kanji() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Kanji value)  $default,){
final _that = this;
switch (_that) {
case _Kanji():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Kanji value)?  $default,){
final _that = this;
switch (_that) {
case _Kanji() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String character,  String? onyomi,  String? kunyomi,  List<String> meanings,  int? strokeCount,  int jlptLevel,  int? grade,  List<KanjiExample> examples,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Kanji() when $default != null:
return $default(_that.id,_that.character,_that.onyomi,_that.kunyomi,_that.meanings,_that.strokeCount,_that.jlptLevel,_that.grade,_that.examples,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String character,  String? onyomi,  String? kunyomi,  List<String> meanings,  int? strokeCount,  int jlptLevel,  int? grade,  List<KanjiExample> examples,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Kanji():
return $default(_that.id,_that.character,_that.onyomi,_that.kunyomi,_that.meanings,_that.strokeCount,_that.jlptLevel,_that.grade,_that.examples,_that.createdAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String character,  String? onyomi,  String? kunyomi,  List<String> meanings,  int? strokeCount,  int jlptLevel,  int? grade,  List<KanjiExample> examples,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Kanji() when $default != null:
return $default(_that.id,_that.character,_that.onyomi,_that.kunyomi,_that.meanings,_that.strokeCount,_that.jlptLevel,_that.grade,_that.examples,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Kanji implements Kanji {
  const _Kanji({this.id, required this.character, this.onyomi, this.kunyomi, required final  List<String> meanings, this.strokeCount, required this.jlptLevel, this.grade, final  List<KanjiExample> examples = const [], this.createdAt}): _meanings = meanings,_examples = examples;
  factory _Kanji.fromJson(Map<String, dynamic> json) => _$KanjiFromJson(json);

@override final  int? id;
@override final  String character;
@override final  String? onyomi;
@override final  String? kunyomi;
 final  List<String> _meanings;
@override List<String> get meanings {
  if (_meanings is EqualUnmodifiableListView) return _meanings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meanings);
}

@override final  int? strokeCount;
@override final  int jlptLevel;
@override final  int? grade;
 final  List<KanjiExample> _examples;
@override@JsonKey() List<KanjiExample> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}

@override final  DateTime? createdAt;

/// Create a copy of Kanji
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KanjiCopyWith<_Kanji> get copyWith => __$KanjiCopyWithImpl<_Kanji>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KanjiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Kanji&&(identical(other.id, id) || other.id == id)&&(identical(other.character, character) || other.character == character)&&(identical(other.onyomi, onyomi) || other.onyomi == onyomi)&&(identical(other.kunyomi, kunyomi) || other.kunyomi == kunyomi)&&const DeepCollectionEquality().equals(other._meanings, _meanings)&&(identical(other.strokeCount, strokeCount) || other.strokeCount == strokeCount)&&(identical(other.jlptLevel, jlptLevel) || other.jlptLevel == jlptLevel)&&(identical(other.grade, grade) || other.grade == grade)&&const DeepCollectionEquality().equals(other._examples, _examples)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,character,onyomi,kunyomi,const DeepCollectionEquality().hash(_meanings),strokeCount,jlptLevel,grade,const DeepCollectionEquality().hash(_examples),createdAt);

@override
String toString() {
  return 'Kanji(id: $id, character: $character, onyomi: $onyomi, kunyomi: $kunyomi, meanings: $meanings, strokeCount: $strokeCount, jlptLevel: $jlptLevel, grade: $grade, examples: $examples, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$KanjiCopyWith<$Res> implements $KanjiCopyWith<$Res> {
  factory _$KanjiCopyWith(_Kanji value, $Res Function(_Kanji) _then) = __$KanjiCopyWithImpl;
@override @useResult
$Res call({
 int? id, String character, String? onyomi, String? kunyomi, List<String> meanings, int? strokeCount, int jlptLevel, int? grade, List<KanjiExample> examples, DateTime? createdAt
});




}
/// @nodoc
class __$KanjiCopyWithImpl<$Res>
    implements _$KanjiCopyWith<$Res> {
  __$KanjiCopyWithImpl(this._self, this._then);

  final _Kanji _self;
  final $Res Function(_Kanji) _then;

/// Create a copy of Kanji
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? character = null,Object? onyomi = freezed,Object? kunyomi = freezed,Object? meanings = null,Object? strokeCount = freezed,Object? jlptLevel = null,Object? grade = freezed,Object? examples = null,Object? createdAt = freezed,}) {
  return _then(_Kanji(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,onyomi: freezed == onyomi ? _self.onyomi : onyomi // ignore: cast_nullable_to_non_nullable
as String?,kunyomi: freezed == kunyomi ? _self.kunyomi : kunyomi // ignore: cast_nullable_to_non_nullable
as String?,meanings: null == meanings ? _self._meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<String>,strokeCount: freezed == strokeCount ? _self.strokeCount : strokeCount // ignore: cast_nullable_to_non_nullable
as int?,jlptLevel: null == jlptLevel ? _self.jlptLevel : jlptLevel // ignore: cast_nullable_to_non_nullable
as int,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<KanjiExample>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$KanjiExample {

 String get word; String? get reading; String? get meaning;
/// Create a copy of KanjiExample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KanjiExampleCopyWith<KanjiExample> get copyWith => _$KanjiExampleCopyWithImpl<KanjiExample>(this as KanjiExample, _$identity);

  /// Serializes this KanjiExample to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KanjiExample&&(identical(other.word, word) || other.word == word)&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,reading,meaning);

@override
String toString() {
  return 'KanjiExample(word: $word, reading: $reading, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class $KanjiExampleCopyWith<$Res>  {
  factory $KanjiExampleCopyWith(KanjiExample value, $Res Function(KanjiExample) _then) = _$KanjiExampleCopyWithImpl;
@useResult
$Res call({
 String word, String? reading, String? meaning
});




}
/// @nodoc
class _$KanjiExampleCopyWithImpl<$Res>
    implements $KanjiExampleCopyWith<$Res> {
  _$KanjiExampleCopyWithImpl(this._self, this._then);

  final KanjiExample _self;
  final $Res Function(KanjiExample) _then;

/// Create a copy of KanjiExample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? reading = freezed,Object? meaning = freezed,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,reading: freezed == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as String?,meaning: freezed == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [KanjiExample].
extension KanjiExamplePatterns on KanjiExample {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KanjiExample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KanjiExample() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KanjiExample value)  $default,){
final _that = this;
switch (_that) {
case _KanjiExample():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KanjiExample value)?  $default,){
final _that = this;
switch (_that) {
case _KanjiExample() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String? reading,  String? meaning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KanjiExample() when $default != null:
return $default(_that.word,_that.reading,_that.meaning);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String? reading,  String? meaning)  $default,) {final _that = this;
switch (_that) {
case _KanjiExample():
return $default(_that.word,_that.reading,_that.meaning);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String? reading,  String? meaning)?  $default,) {final _that = this;
switch (_that) {
case _KanjiExample() when $default != null:
return $default(_that.word,_that.reading,_that.meaning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KanjiExample implements KanjiExample {
  const _KanjiExample({required this.word, this.reading, this.meaning});
  factory _KanjiExample.fromJson(Map<String, dynamic> json) => _$KanjiExampleFromJson(json);

@override final  String word;
@override final  String? reading;
@override final  String? meaning;

/// Create a copy of KanjiExample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KanjiExampleCopyWith<_KanjiExample> get copyWith => __$KanjiExampleCopyWithImpl<_KanjiExample>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KanjiExampleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KanjiExample&&(identical(other.word, word) || other.word == word)&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,reading,meaning);

@override
String toString() {
  return 'KanjiExample(word: $word, reading: $reading, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class _$KanjiExampleCopyWith<$Res> implements $KanjiExampleCopyWith<$Res> {
  factory _$KanjiExampleCopyWith(_KanjiExample value, $Res Function(_KanjiExample) _then) = __$KanjiExampleCopyWithImpl;
@override @useResult
$Res call({
 String word, String? reading, String? meaning
});




}
/// @nodoc
class __$KanjiExampleCopyWithImpl<$Res>
    implements _$KanjiExampleCopyWith<$Res> {
  __$KanjiExampleCopyWithImpl(this._self, this._then);

  final _KanjiExample _self;
  final $Res Function(_KanjiExample) _then;

/// Create a copy of KanjiExample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? reading = freezed,Object? meaning = freezed,}) {
  return _then(_KanjiExample(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,reading: freezed == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as String?,meaning: freezed == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
