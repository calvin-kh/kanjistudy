// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudyProgress {

 int? get id; int get kanjiId; StudyStatus get status; DateTime? get updatedAt;
/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyProgressCopyWith<StudyProgress> get copyWith => _$StudyProgressCopyWithImpl<StudyProgress>(this as StudyProgress, _$identity);

  /// Serializes this StudyProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kanjiId,status,updatedAt);

@override
String toString() {
  return 'StudyProgress(id: $id, kanjiId: $kanjiId, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StudyProgressCopyWith<$Res>  {
  factory $StudyProgressCopyWith(StudyProgress value, $Res Function(StudyProgress) _then) = _$StudyProgressCopyWithImpl;
@useResult
$Res call({
 int? id, int kanjiId, StudyStatus status, DateTime? updatedAt
});




}
/// @nodoc
class _$StudyProgressCopyWithImpl<$Res>
    implements $StudyProgressCopyWith<$Res> {
  _$StudyProgressCopyWithImpl(this._self, this._then);

  final StudyProgress _self;
  final $Res Function(StudyProgress) _then;

/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? kanjiId = null,Object? status = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StudyStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudyProgress].
extension StudyProgressPatterns on StudyProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudyProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudyProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudyProgress value)  $default,){
final _that = this;
switch (_that) {
case _StudyProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudyProgress value)?  $default,){
final _that = this;
switch (_that) {
case _StudyProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int kanjiId,  StudyStatus status,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudyProgress() when $default != null:
return $default(_that.id,_that.kanjiId,_that.status,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int kanjiId,  StudyStatus status,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _StudyProgress():
return $default(_that.id,_that.kanjiId,_that.status,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int kanjiId,  StudyStatus status,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _StudyProgress() when $default != null:
return $default(_that.id,_that.kanjiId,_that.status,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudyProgress implements StudyProgress {
  const _StudyProgress({this.id, required this.kanjiId, this.status = StudyStatus.notStarted, this.updatedAt});
  factory _StudyProgress.fromJson(Map<String, dynamic> json) => _$StudyProgressFromJson(json);

@override final  int? id;
@override final  int kanjiId;
@override@JsonKey() final  StudyStatus status;
@override final  DateTime? updatedAt;

/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyProgressCopyWith<_StudyProgress> get copyWith => __$StudyProgressCopyWithImpl<_StudyProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudyProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.kanjiId, kanjiId) || other.kanjiId == kanjiId)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kanjiId,status,updatedAt);

@override
String toString() {
  return 'StudyProgress(id: $id, kanjiId: $kanjiId, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StudyProgressCopyWith<$Res> implements $StudyProgressCopyWith<$Res> {
  factory _$StudyProgressCopyWith(_StudyProgress value, $Res Function(_StudyProgress) _then) = __$StudyProgressCopyWithImpl;
@override @useResult
$Res call({
 int? id, int kanjiId, StudyStatus status, DateTime? updatedAt
});




}
/// @nodoc
class __$StudyProgressCopyWithImpl<$Res>
    implements _$StudyProgressCopyWith<$Res> {
  __$StudyProgressCopyWithImpl(this._self, this._then);

  final _StudyProgress _self;
  final $Res Function(_StudyProgress) _then;

/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? kanjiId = null,Object? status = null,Object? updatedAt = freezed,}) {
  return _then(_StudyProgress(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,kanjiId: null == kanjiId ? _self.kanjiId : kanjiId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StudyStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
