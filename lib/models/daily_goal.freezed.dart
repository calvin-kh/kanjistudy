// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyGoal {

 int? get id; String get date; int get targetCount; int get studiedCount; int get quizCount; int get correctCount; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of DailyGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyGoalCopyWith<DailyGoal> get copyWith => _$DailyGoalCopyWithImpl<DailyGoal>(this as DailyGoal, _$identity);

  /// Serializes this DailyGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.targetCount, targetCount) || other.targetCount == targetCount)&&(identical(other.studiedCount, studiedCount) || other.studiedCount == studiedCount)&&(identical(other.quizCount, quizCount) || other.quizCount == quizCount)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,targetCount,studiedCount,quizCount,correctCount,createdAt,updatedAt);

@override
String toString() {
  return 'DailyGoal(id: $id, date: $date, targetCount: $targetCount, studiedCount: $studiedCount, quizCount: $quizCount, correctCount: $correctCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DailyGoalCopyWith<$Res>  {
  factory $DailyGoalCopyWith(DailyGoal value, $Res Function(DailyGoal) _then) = _$DailyGoalCopyWithImpl;
@useResult
$Res call({
 int? id, String date, int targetCount, int studiedCount, int quizCount, int correctCount, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DailyGoalCopyWithImpl<$Res>
    implements $DailyGoalCopyWith<$Res> {
  _$DailyGoalCopyWithImpl(this._self, this._then);

  final DailyGoal _self;
  final $Res Function(DailyGoal) _then;

/// Create a copy of DailyGoal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = null,Object? targetCount = null,Object? studiedCount = null,Object? quizCount = null,Object? correctCount = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,targetCount: null == targetCount ? _self.targetCount : targetCount // ignore: cast_nullable_to_non_nullable
as int,studiedCount: null == studiedCount ? _self.studiedCount : studiedCount // ignore: cast_nullable_to_non_nullable
as int,quizCount: null == quizCount ? _self.quizCount : quizCount // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyGoal].
extension DailyGoalPatterns on DailyGoal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyGoal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyGoal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyGoal value)  $default,){
final _that = this;
switch (_that) {
case _DailyGoal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyGoal value)?  $default,){
final _that = this;
switch (_that) {
case _DailyGoal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String date,  int targetCount,  int studiedCount,  int quizCount,  int correctCount,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyGoal() when $default != null:
return $default(_that.id,_that.date,_that.targetCount,_that.studiedCount,_that.quizCount,_that.correctCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String date,  int targetCount,  int studiedCount,  int quizCount,  int correctCount,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DailyGoal():
return $default(_that.id,_that.date,_that.targetCount,_that.studiedCount,_that.quizCount,_that.correctCount,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String date,  int targetCount,  int studiedCount,  int quizCount,  int correctCount,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DailyGoal() when $default != null:
return $default(_that.id,_that.date,_that.targetCount,_that.studiedCount,_that.quizCount,_that.correctCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyGoal implements DailyGoal {
  const _DailyGoal({this.id, required this.date, this.targetCount = 10, this.studiedCount = 0, this.quizCount = 0, this.correctCount = 0, this.createdAt, this.updatedAt});
  factory _DailyGoal.fromJson(Map<String, dynamic> json) => _$DailyGoalFromJson(json);

@override final  int? id;
@override final  String date;
@override@JsonKey() final  int targetCount;
@override@JsonKey() final  int studiedCount;
@override@JsonKey() final  int quizCount;
@override@JsonKey() final  int correctCount;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of DailyGoal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyGoalCopyWith<_DailyGoal> get copyWith => __$DailyGoalCopyWithImpl<_DailyGoal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyGoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.targetCount, targetCount) || other.targetCount == targetCount)&&(identical(other.studiedCount, studiedCount) || other.studiedCount == studiedCount)&&(identical(other.quizCount, quizCount) || other.quizCount == quizCount)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,targetCount,studiedCount,quizCount,correctCount,createdAt,updatedAt);

@override
String toString() {
  return 'DailyGoal(id: $id, date: $date, targetCount: $targetCount, studiedCount: $studiedCount, quizCount: $quizCount, correctCount: $correctCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DailyGoalCopyWith<$Res> implements $DailyGoalCopyWith<$Res> {
  factory _$DailyGoalCopyWith(_DailyGoal value, $Res Function(_DailyGoal) _then) = __$DailyGoalCopyWithImpl;
@override @useResult
$Res call({
 int? id, String date, int targetCount, int studiedCount, int quizCount, int correctCount, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DailyGoalCopyWithImpl<$Res>
    implements _$DailyGoalCopyWith<$Res> {
  __$DailyGoalCopyWithImpl(this._self, this._then);

  final _DailyGoal _self;
  final $Res Function(_DailyGoal) _then;

/// Create a copy of DailyGoal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = null,Object? targetCount = null,Object? studiedCount = null,Object? quizCount = null,Object? correctCount = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DailyGoal(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,targetCount: null == targetCount ? _self.targetCount : targetCount // ignore: cast_nullable_to_non_nullable
as int,studiedCount: null == studiedCount ? _self.studiedCount : studiedCount // ignore: cast_nullable_to_non_nullable
as int,quizCount: null == quizCount ? _self.quizCount : quizCount // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
