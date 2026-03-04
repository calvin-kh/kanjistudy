// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQuestion {

 int get kanjiId; String get character; QuizType get type; String get question; List<String> get options; String get correctAnswer;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.character, character) || other.character == character)&&(identical(other.type, type) || other.type == type)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kanjiId,character,type,question,const DeepCollectionEquality().hash(options),correctAnswer);

@override
String toString() {
  return 'QuizQuestion(kanjiId: $kanjiId, character: $character, type: $type, question: $question, options: $options, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 int kanjiId, String character, QuizType type, String question, List<String> options, String correctAnswer
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kanjiId = null,Object? character = null,Object? type = null,Object? question = null,Object? options = null,Object? correctAnswer = null,}) {
  return _then(_self.copyWith(
kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizType,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int kanjiId,  String character,  QuizType type,  String question,  List<String> options,  String correctAnswer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.kanjiId,_that.character,_that.type,_that.question,_that.options,_that.correctAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int kanjiId,  String character,  QuizType type,  String question,  List<String> options,  String correctAnswer)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.kanjiId,_that.character,_that.type,_that.question,_that.options,_that.correctAnswer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int kanjiId,  String character,  QuizType type,  String question,  List<String> options,  String correctAnswer)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.kanjiId,_that.character,_that.type,_that.question,_that.options,_that.correctAnswer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.kanjiId, required this.character, required this.type, required this.question, required final  List<String> options, required this.correctAnswer}): _options = options;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  int kanjiId;
@override final  String character;
@override final  QuizType type;
@override final  String question;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  String correctAnswer;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.character, character) || other.character == character)&&(identical(other.type, type) || other.type == type)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kanjiId,character,type,question,const DeepCollectionEquality().hash(_options),correctAnswer);

@override
String toString() {
  return 'QuizQuestion(kanjiId: $kanjiId, character: $character, type: $type, question: $question, options: $options, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 int kanjiId, String character, QuizType type, String question, List<String> options, String correctAnswer
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kanjiId = null,Object? character = null,Object? type = null,Object? question = null,Object? options = null,Object? correctAnswer = null,}) {
  return _then(_QuizQuestion(
kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizType,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuizItemStats {

 int? get id; int get kanjiId; String get quizType; int get quizCount; int get correctCount; int get incorrectCount; DateTime? get lastQuizzedAt; DateTime? get lastCorrectAt; DateTime? get lastIncorrectAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of QuizItemStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizItemStatsCopyWith<QuizItemStats> get copyWith => _$QuizItemStatsCopyWithImpl<QuizItemStats>(this as QuizItemStats, _$identity);

  /// Serializes this QuizItemStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizItemStats&&(identical(other.id, id) || other.id == id)&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.quizCount, quizCount) || other.quizCount == quizCount)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.incorrectCount, incorrectCount) || other.incorrectCount == incorrectCount)&&(identical(other.lastQuizzedAt, lastQuizzedAt) || other.lastQuizzedAt == lastQuizzedAt)&&(identical(other.lastCorrectAt, lastCorrectAt) || other.lastCorrectAt == lastCorrectAt)&&(identical(other.lastIncorrectAt, lastIncorrectAt) || other.lastIncorrectAt == lastIncorrectAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kanjiId,quizType,quizCount,correctCount,incorrectCount,lastQuizzedAt,lastCorrectAt,lastIncorrectAt,createdAt,updatedAt);

@override
String toString() {
  return 'QuizItemStats(id: $id, kanjiId: $kanjiId, quizType: $quizType, quizCount: $quizCount, correctCount: $correctCount, incorrectCount: $incorrectCount, lastQuizzedAt: $lastQuizzedAt, lastCorrectAt: $lastCorrectAt, lastIncorrectAt: $lastIncorrectAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $QuizItemStatsCopyWith<$Res>  {
  factory $QuizItemStatsCopyWith(QuizItemStats value, $Res Function(QuizItemStats) _then) = _$QuizItemStatsCopyWithImpl;
@useResult
$Res call({
 int? id, int kanjiId, String quizType, int quizCount, int correctCount, int incorrectCount, DateTime? lastQuizzedAt, DateTime? lastCorrectAt, DateTime? lastIncorrectAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$QuizItemStatsCopyWithImpl<$Res>
    implements $QuizItemStatsCopyWith<$Res> {
  _$QuizItemStatsCopyWithImpl(this._self, this._then);

  final QuizItemStats _self;
  final $Res Function(QuizItemStats) _then;

/// Create a copy of QuizItemStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? kanjiId = null,Object? quizType = null,Object? quizCount = null,Object? correctCount = null,Object? incorrectCount = null,Object? lastQuizzedAt = freezed,Object? lastCorrectAt = freezed,Object? lastIncorrectAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as String,quizCount: null == quizCount ? _self.quizCount : quizCount // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,incorrectCount: null == incorrectCount ? _self.incorrectCount : incorrectCount // ignore: cast_nullable_to_non_nullable
as int,lastQuizzedAt: freezed == lastQuizzedAt ? _self.lastQuizzedAt : lastQuizzedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastCorrectAt: freezed == lastCorrectAt ? _self.lastCorrectAt : lastCorrectAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastIncorrectAt: freezed == lastIncorrectAt ? _self.lastIncorrectAt : lastIncorrectAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizItemStats].
extension QuizItemStatsPatterns on QuizItemStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizItemStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizItemStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizItemStats value)  $default,){
final _that = this;
switch (_that) {
case _QuizItemStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizItemStats value)?  $default,){
final _that = this;
switch (_that) {
case _QuizItemStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int kanjiId,  String quizType,  int quizCount,  int correctCount,  int incorrectCount,  DateTime? lastQuizzedAt,  DateTime? lastCorrectAt,  DateTime? lastIncorrectAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizItemStats() when $default != null:
return $default(_that.id,_that.kanjiId,_that.quizType,_that.quizCount,_that.correctCount,_that.incorrectCount,_that.lastQuizzedAt,_that.lastCorrectAt,_that.lastIncorrectAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int kanjiId,  String quizType,  int quizCount,  int correctCount,  int incorrectCount,  DateTime? lastQuizzedAt,  DateTime? lastCorrectAt,  DateTime? lastIncorrectAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _QuizItemStats():
return $default(_that.id,_that.kanjiId,_that.quizType,_that.quizCount,_that.correctCount,_that.incorrectCount,_that.lastQuizzedAt,_that.lastCorrectAt,_that.lastIncorrectAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int kanjiId,  String quizType,  int quizCount,  int correctCount,  int incorrectCount,  DateTime? lastQuizzedAt,  DateTime? lastCorrectAt,  DateTime? lastIncorrectAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizItemStats() when $default != null:
return $default(_that.id,_that.kanjiId,_that.quizType,_that.quizCount,_that.correctCount,_that.incorrectCount,_that.lastQuizzedAt,_that.lastCorrectAt,_that.lastIncorrectAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizItemStats implements QuizItemStats {
  const _QuizItemStats({this.id, required this.kanjiId, required this.quizType, this.quizCount = 0, this.correctCount = 0, this.incorrectCount = 0, this.lastQuizzedAt, this.lastCorrectAt, this.lastIncorrectAt, this.createdAt, this.updatedAt});
  factory _QuizItemStats.fromJson(Map<String, dynamic> json) => _$QuizItemStatsFromJson(json);

@override final  int? id;
@override final  int kanjiId;
@override final  String quizType;
@override@JsonKey() final  int quizCount;
@override@JsonKey() final  int correctCount;
@override@JsonKey() final  int incorrectCount;
@override final  DateTime? lastQuizzedAt;
@override final  DateTime? lastCorrectAt;
@override final  DateTime? lastIncorrectAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of QuizItemStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizItemStatsCopyWith<_QuizItemStats> get copyWith => __$QuizItemStatsCopyWithImpl<_QuizItemStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizItemStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizItemStats&&(identical(other.id, id) || other.id == id)&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.quizCount, quizCount) || other.quizCount == quizCount)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.incorrectCount, incorrectCount) || other.incorrectCount == incorrectCount)&&(identical(other.lastQuizzedAt, lastQuizzedAt) || other.lastQuizzedAt == lastQuizzedAt)&&(identical(other.lastCorrectAt, lastCorrectAt) || other.lastCorrectAt == lastCorrectAt)&&(identical(other.lastIncorrectAt, lastIncorrectAt) || other.lastIncorrectAt == lastIncorrectAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kanjiId,quizType,quizCount,correctCount,incorrectCount,lastQuizzedAt,lastCorrectAt,lastIncorrectAt,createdAt,updatedAt);

@override
String toString() {
  return 'QuizItemStats(id: $id, kanjiId: $kanjiId, quizType: $quizType, quizCount: $quizCount, correctCount: $correctCount, incorrectCount: $incorrectCount, lastQuizzedAt: $lastQuizzedAt, lastCorrectAt: $lastCorrectAt, lastIncorrectAt: $lastIncorrectAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$QuizItemStatsCopyWith<$Res> implements $QuizItemStatsCopyWith<$Res> {
  factory _$QuizItemStatsCopyWith(_QuizItemStats value, $Res Function(_QuizItemStats) _then) = __$QuizItemStatsCopyWithImpl;
@override @useResult
$Res call({
 int? id, int kanjiId, String quizType, int quizCount, int correctCount, int incorrectCount, DateTime? lastQuizzedAt, DateTime? lastCorrectAt, DateTime? lastIncorrectAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$QuizItemStatsCopyWithImpl<$Res>
    implements _$QuizItemStatsCopyWith<$Res> {
  __$QuizItemStatsCopyWithImpl(this._self, this._then);

  final _QuizItemStats _self;
  final $Res Function(_QuizItemStats) _then;

/// Create a copy of QuizItemStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? kanjiId = null,Object? quizType = null,Object? quizCount = null,Object? correctCount = null,Object? incorrectCount = null,Object? lastQuizzedAt = freezed,Object? lastCorrectAt = freezed,Object? lastIncorrectAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_QuizItemStats(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as String,quizCount: null == quizCount ? _self.quizCount : quizCount // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,incorrectCount: null == incorrectCount ? _self.incorrectCount : incorrectCount // ignore: cast_nullable_to_non_nullable
as int,lastQuizzedAt: freezed == lastQuizzedAt ? _self.lastQuizzedAt : lastQuizzedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastCorrectAt: freezed == lastCorrectAt ? _self.lastCorrectAt : lastCorrectAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastIncorrectAt: freezed == lastIncorrectAt ? _self.lastIncorrectAt : lastIncorrectAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$QuizResult {

 int? get id; int get kanjiId; String get quizType; String? get userAnswer; String? get correctAnswer; bool get isCorrect; DateTime? get createdAt;
/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizResultCopyWith<QuizResult> get copyWith => _$QuizResultCopyWithImpl<QuizResult>(this as QuizResult, _$identity);

  /// Serializes this QuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizResult&&(identical(other.id, id) || other.id == id)&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kanjiId,quizType,userAnswer,correctAnswer,isCorrect,createdAt);

@override
String toString() {
  return 'QuizResult(id: $id, kanjiId: $kanjiId, quizType: $quizType, userAnswer: $userAnswer, correctAnswer: $correctAnswer, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QuizResultCopyWith<$Res>  {
  factory $QuizResultCopyWith(QuizResult value, $Res Function(QuizResult) _then) = _$QuizResultCopyWithImpl;
@useResult
$Res call({
 int? id, int kanjiId, String quizType, String? userAnswer, String? correctAnswer, bool isCorrect, DateTime? createdAt
});




}
/// @nodoc
class _$QuizResultCopyWithImpl<$Res>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._self, this._then);

  final QuizResult _self;
  final $Res Function(QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? kanjiId = null,Object? quizType = null,Object? userAnswer = freezed,Object? correctAnswer = freezed,Object? isCorrect = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as String,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String?,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizResult].
extension QuizResultPatterns on QuizResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizResult value)  $default,){
final _that = this;
switch (_that) {
case _QuizResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int kanjiId,  String quizType,  String? userAnswer,  String? correctAnswer,  bool isCorrect,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.id,_that.kanjiId,_that.quizType,_that.userAnswer,_that.correctAnswer,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int kanjiId,  String quizType,  String? userAnswer,  String? correctAnswer,  bool isCorrect,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _QuizResult():
return $default(_that.id,_that.kanjiId,_that.quizType,_that.userAnswer,_that.correctAnswer,_that.isCorrect,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int kanjiId,  String quizType,  String? userAnswer,  String? correctAnswer,  bool isCorrect,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.id,_that.kanjiId,_that.quizType,_that.userAnswer,_that.correctAnswer,_that.isCorrect,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizResult implements QuizResult {
  const _QuizResult({this.id, required this.kanjiId, required this.quizType, this.userAnswer, this.correctAnswer, required this.isCorrect, this.createdAt});
  factory _QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);

@override final  int? id;
@override final  int kanjiId;
@override final  String quizType;
@override final  String? userAnswer;
@override final  String? correctAnswer;
@override final  bool isCorrect;
@override final  DateTime? createdAt;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizResultCopyWith<_QuizResult> get copyWith => __$QuizResultCopyWithImpl<_QuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizResult&&(identical(other.id, id) || other.id == id)&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kanjiId,quizType,userAnswer,correctAnswer,isCorrect,createdAt);

@override
String toString() {
  return 'QuizResult(id: $id, kanjiId: $kanjiId, quizType: $quizType, userAnswer: $userAnswer, correctAnswer: $correctAnswer, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuizResultCopyWith<$Res> implements $QuizResultCopyWith<$Res> {
  factory _$QuizResultCopyWith(_QuizResult value, $Res Function(_QuizResult) _then) = __$QuizResultCopyWithImpl;
@override @useResult
$Res call({
 int? id, int kanjiId, String quizType, String? userAnswer, String? correctAnswer, bool isCorrect, DateTime? createdAt
});




}
/// @nodoc
class __$QuizResultCopyWithImpl<$Res>
    implements _$QuizResultCopyWith<$Res> {
  __$QuizResultCopyWithImpl(this._self, this._then);

  final _QuizResult _self;
  final $Res Function(_QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? kanjiId = null,Object? quizType = null,Object? userAnswer = freezed,Object? correctAnswer = freezed,Object? isCorrect = null,Object? createdAt = freezed,}) {
  return _then(_QuizResult(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as String,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String?,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$QuizSessionResult {

 QuizType get quizType; int get totalQuestions; int get correctCount; int get incorrectCount; double get accuracy; Duration get duration; List<QuizAnswerRecord> get answers;
/// Create a copy of QuizSessionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizSessionResultCopyWith<QuizSessionResult> get copyWith => _$QuizSessionResultCopyWithImpl<QuizSessionResult>(this as QuizSessionResult, _$identity);

  /// Serializes this QuizSessionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizSessionResult&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.incorrectCount, incorrectCount) || other.incorrectCount == incorrectCount)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quizType,totalQuestions,correctCount,incorrectCount,accuracy,duration,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'QuizSessionResult(quizType: $quizType, totalQuestions: $totalQuestions, correctCount: $correctCount, incorrectCount: $incorrectCount, accuracy: $accuracy, duration: $duration, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $QuizSessionResultCopyWith<$Res>  {
  factory $QuizSessionResultCopyWith(QuizSessionResult value, $Res Function(QuizSessionResult) _then) = _$QuizSessionResultCopyWithImpl;
@useResult
$Res call({
 QuizType quizType, int totalQuestions, int correctCount, int incorrectCount, double accuracy, Duration duration, List<QuizAnswerRecord> answers
});




}
/// @nodoc
class _$QuizSessionResultCopyWithImpl<$Res>
    implements $QuizSessionResultCopyWith<$Res> {
  _$QuizSessionResultCopyWithImpl(this._self, this._then);

  final QuizSessionResult _self;
  final $Res Function(QuizSessionResult) _then;

/// Create a copy of QuizSessionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quizType = null,Object? totalQuestions = null,Object? correctCount = null,Object? incorrectCount = null,Object? accuracy = null,Object? duration = null,Object? answers = null,}) {
  return _then(_self.copyWith(
quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as QuizType,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,incorrectCount: null == incorrectCount ? _self.incorrectCount : incorrectCount // ignore: cast_nullable_to_non_nullable
as int,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<QuizAnswerRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizSessionResult].
extension QuizSessionResultPatterns on QuizSessionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizSessionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizSessionResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizSessionResult value)  $default,){
final _that = this;
switch (_that) {
case _QuizSessionResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizSessionResult value)?  $default,){
final _that = this;
switch (_that) {
case _QuizSessionResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuizType quizType,  int totalQuestions,  int correctCount,  int incorrectCount,  double accuracy,  Duration duration,  List<QuizAnswerRecord> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizSessionResult() when $default != null:
return $default(_that.quizType,_that.totalQuestions,_that.correctCount,_that.incorrectCount,_that.accuracy,_that.duration,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuizType quizType,  int totalQuestions,  int correctCount,  int incorrectCount,  double accuracy,  Duration duration,  List<QuizAnswerRecord> answers)  $default,) {final _that = this;
switch (_that) {
case _QuizSessionResult():
return $default(_that.quizType,_that.totalQuestions,_that.correctCount,_that.incorrectCount,_that.accuracy,_that.duration,_that.answers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuizType quizType,  int totalQuestions,  int correctCount,  int incorrectCount,  double accuracy,  Duration duration,  List<QuizAnswerRecord> answers)?  $default,) {final _that = this;
switch (_that) {
case _QuizSessionResult() when $default != null:
return $default(_that.quizType,_that.totalQuestions,_that.correctCount,_that.incorrectCount,_that.accuracy,_that.duration,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizSessionResult implements QuizSessionResult {
  const _QuizSessionResult({required this.quizType, required this.totalQuestions, required this.correctCount, required this.incorrectCount, required this.accuracy, required this.duration, required final  List<QuizAnswerRecord> answers}): _answers = answers;
  factory _QuizSessionResult.fromJson(Map<String, dynamic> json) => _$QuizSessionResultFromJson(json);

@override final  QuizType quizType;
@override final  int totalQuestions;
@override final  int correctCount;
@override final  int incorrectCount;
@override final  double accuracy;
@override final  Duration duration;
 final  List<QuizAnswerRecord> _answers;
@override List<QuizAnswerRecord> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of QuizSessionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizSessionResultCopyWith<_QuizSessionResult> get copyWith => __$QuizSessionResultCopyWithImpl<_QuizSessionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizSessionResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizSessionResult&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.incorrectCount, incorrectCount) || other.incorrectCount == incorrectCount)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quizType,totalQuestions,correctCount,incorrectCount,accuracy,duration,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'QuizSessionResult(quizType: $quizType, totalQuestions: $totalQuestions, correctCount: $correctCount, incorrectCount: $incorrectCount, accuracy: $accuracy, duration: $duration, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$QuizSessionResultCopyWith<$Res> implements $QuizSessionResultCopyWith<$Res> {
  factory _$QuizSessionResultCopyWith(_QuizSessionResult value, $Res Function(_QuizSessionResult) _then) = __$QuizSessionResultCopyWithImpl;
@override @useResult
$Res call({
 QuizType quizType, int totalQuestions, int correctCount, int incorrectCount, double accuracy, Duration duration, List<QuizAnswerRecord> answers
});




}
/// @nodoc
class __$QuizSessionResultCopyWithImpl<$Res>
    implements _$QuizSessionResultCopyWith<$Res> {
  __$QuizSessionResultCopyWithImpl(this._self, this._then);

  final _QuizSessionResult _self;
  final $Res Function(_QuizSessionResult) _then;

/// Create a copy of QuizSessionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quizType = null,Object? totalQuestions = null,Object? correctCount = null,Object? incorrectCount = null,Object? accuracy = null,Object? duration = null,Object? answers = null,}) {
  return _then(_QuizSessionResult(
quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as QuizType,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,incorrectCount: null == incorrectCount ? _self.incorrectCount : incorrectCount // ignore: cast_nullable_to_non_nullable
as int,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<QuizAnswerRecord>,
  ));
}


}


/// @nodoc
mixin _$QuizAnswerRecord {

 int get kanjiId; String get character; String get question; String get userAnswer; String get correctAnswer; bool get isCorrect;
/// Create a copy of QuizAnswerRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAnswerRecordCopyWith<QuizAnswerRecord> get copyWith => _$QuizAnswerRecordCopyWithImpl<QuizAnswerRecord>(this as QuizAnswerRecord, _$identity);

  /// Serializes this QuizAnswerRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswerRecord&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.character, character) || other.character == character)&&(identical(other.question, question) || other.question == question)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kanjiId,character,question,userAnswer,correctAnswer,isCorrect);

@override
String toString() {
  return 'QuizAnswerRecord(kanjiId: $kanjiId, character: $character, question: $question, userAnswer: $userAnswer, correctAnswer: $correctAnswer, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $QuizAnswerRecordCopyWith<$Res>  {
  factory $QuizAnswerRecordCopyWith(QuizAnswerRecord value, $Res Function(QuizAnswerRecord) _then) = _$QuizAnswerRecordCopyWithImpl;
@useResult
$Res call({
 int kanjiId, String character, String question, String userAnswer, String correctAnswer, bool isCorrect
});




}
/// @nodoc
class _$QuizAnswerRecordCopyWithImpl<$Res>
    implements $QuizAnswerRecordCopyWith<$Res> {
  _$QuizAnswerRecordCopyWithImpl(this._self, this._then);

  final QuizAnswerRecord _self;
  final $Res Function(QuizAnswerRecord) _then;

/// Create a copy of QuizAnswerRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kanjiId = null,Object? character = null,Object? question = null,Object? userAnswer = null,Object? correctAnswer = null,Object? isCorrect = null,}) {
  return _then(_self.copyWith(
kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAnswerRecord].
extension QuizAnswerRecordPatterns on QuizAnswerRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAnswerRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAnswerRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAnswerRecord value)  $default,){
final _that = this;
switch (_that) {
case _QuizAnswerRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAnswerRecord value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAnswerRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int kanjiId,  String character,  String question,  String userAnswer,  String correctAnswer,  bool isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAnswerRecord() when $default != null:
return $default(_that.kanjiId,_that.character,_that.question,_that.userAnswer,_that.correctAnswer,_that.isCorrect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int kanjiId,  String character,  String question,  String userAnswer,  String correctAnswer,  bool isCorrect)  $default,) {final _that = this;
switch (_that) {
case _QuizAnswerRecord():
return $default(_that.kanjiId,_that.character,_that.question,_that.userAnswer,_that.correctAnswer,_that.isCorrect);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int kanjiId,  String character,  String question,  String userAnswer,  String correctAnswer,  bool isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _QuizAnswerRecord() when $default != null:
return $default(_that.kanjiId,_that.character,_that.question,_that.userAnswer,_that.correctAnswer,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAnswerRecord implements QuizAnswerRecord {
  const _QuizAnswerRecord({required this.kanjiId, required this.character, required this.question, required this.userAnswer, required this.correctAnswer, required this.isCorrect});
  factory _QuizAnswerRecord.fromJson(Map<String, dynamic> json) => _$QuizAnswerRecordFromJson(json);

@override final  int kanjiId;
@override final  String character;
@override final  String question;
@override final  String userAnswer;
@override final  String correctAnswer;
@override final  bool isCorrect;

/// Create a copy of QuizAnswerRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAnswerRecordCopyWith<_QuizAnswerRecord> get copyWith => __$QuizAnswerRecordCopyWithImpl<_QuizAnswerRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAnswerRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAnswerRecord&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.character, character) || other.character == character)&&(identical(other.question, question) || other.question == question)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kanjiId,character,question,userAnswer,correctAnswer,isCorrect);

@override
String toString() {
  return 'QuizAnswerRecord(kanjiId: $kanjiId, character: $character, question: $question, userAnswer: $userAnswer, correctAnswer: $correctAnswer, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$QuizAnswerRecordCopyWith<$Res> implements $QuizAnswerRecordCopyWith<$Res> {
  factory _$QuizAnswerRecordCopyWith(_QuizAnswerRecord value, $Res Function(_QuizAnswerRecord) _then) = __$QuizAnswerRecordCopyWithImpl;
@override @useResult
$Res call({
 int kanjiId, String character, String question, String userAnswer, String correctAnswer, bool isCorrect
});




}
/// @nodoc
class __$QuizAnswerRecordCopyWithImpl<$Res>
    implements _$QuizAnswerRecordCopyWith<$Res> {
  __$QuizAnswerRecordCopyWithImpl(this._self, this._then);

  final _QuizAnswerRecord _self;
  final $Res Function(_QuizAnswerRecord) _then;

/// Create a copy of QuizAnswerRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kanjiId = null,Object? character = null,Object? question = null,Object? userAnswer = null,Object? correctAnswer = null,Object? isCorrect = null,}) {
  return _then(_QuizAnswerRecord(
kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
