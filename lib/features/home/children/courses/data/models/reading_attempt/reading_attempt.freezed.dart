// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadingAttempt {

 int get id; int get aiReadingId; int get userId; int get timeSpentSec; int get playCount; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ReadingAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingAttemptCopyWith<ReadingAttempt> get copyWith => _$ReadingAttemptCopyWithImpl<ReadingAttempt>(this as ReadingAttempt, _$identity);

  /// Serializes this ReadingAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.timeSpentSec, timeSpentSec) || other.timeSpentSec == timeSpentSec)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aiReadingId,userId,timeSpentSec,playCount,createdAt,updatedAt);

@override
String toString() {
  return 'ReadingAttempt(id: $id, aiReadingId: $aiReadingId, userId: $userId, timeSpentSec: $timeSpentSec, playCount: $playCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReadingAttemptCopyWith<$Res>  {
  factory $ReadingAttemptCopyWith(ReadingAttempt value, $Res Function(ReadingAttempt) _then) = _$ReadingAttemptCopyWithImpl;
@useResult
$Res call({
 int id, int aiReadingId, int userId, int timeSpentSec, int playCount, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ReadingAttemptCopyWithImpl<$Res>
    implements $ReadingAttemptCopyWith<$Res> {
  _$ReadingAttemptCopyWithImpl(this._self, this._then);

  final ReadingAttempt _self;
  final $Res Function(ReadingAttempt) _then;

/// Create a copy of ReadingAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? aiReadingId = null,Object? userId = null,Object? timeSpentSec = null,Object? playCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,timeSpentSec: null == timeSpentSec ? _self.timeSpentSec : timeSpentSec // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingAttempt].
extension ReadingAttemptPatterns on ReadingAttempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingAttempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingAttempt value)  $default,){
final _that = this;
switch (_that) {
case _ReadingAttempt():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingAttempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int aiReadingId,  int userId,  int timeSpentSec,  int playCount,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingAttempt() when $default != null:
return $default(_that.id,_that.aiReadingId,_that.userId,_that.timeSpentSec,_that.playCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int aiReadingId,  int userId,  int timeSpentSec,  int playCount,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReadingAttempt():
return $default(_that.id,_that.aiReadingId,_that.userId,_that.timeSpentSec,_that.playCount,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int aiReadingId,  int userId,  int timeSpentSec,  int playCount,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReadingAttempt() when $default != null:
return $default(_that.id,_that.aiReadingId,_that.userId,_that.timeSpentSec,_that.playCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadingAttempt implements ReadingAttempt {
  const _ReadingAttempt({required this.id, required this.aiReadingId, required this.userId, required this.timeSpentSec, required this.playCount, required this.createdAt, required this.updatedAt});
  factory _ReadingAttempt.fromJson(Map<String, dynamic> json) => _$ReadingAttemptFromJson(json);

@override final  int id;
@override final  int aiReadingId;
@override final  int userId;
@override final  int timeSpentSec;
@override final  int playCount;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ReadingAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingAttemptCopyWith<_ReadingAttempt> get copyWith => __$ReadingAttemptCopyWithImpl<_ReadingAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadingAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.timeSpentSec, timeSpentSec) || other.timeSpentSec == timeSpentSec)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aiReadingId,userId,timeSpentSec,playCount,createdAt,updatedAt);

@override
String toString() {
  return 'ReadingAttempt(id: $id, aiReadingId: $aiReadingId, userId: $userId, timeSpentSec: $timeSpentSec, playCount: $playCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReadingAttemptCopyWith<$Res> implements $ReadingAttemptCopyWith<$Res> {
  factory _$ReadingAttemptCopyWith(_ReadingAttempt value, $Res Function(_ReadingAttempt) _then) = __$ReadingAttemptCopyWithImpl;
@override @useResult
$Res call({
 int id, int aiReadingId, int userId, int timeSpentSec, int playCount, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ReadingAttemptCopyWithImpl<$Res>
    implements _$ReadingAttemptCopyWith<$Res> {
  __$ReadingAttemptCopyWithImpl(this._self, this._then);

  final _ReadingAttempt _self;
  final $Res Function(_ReadingAttempt) _then;

/// Create a copy of ReadingAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? aiReadingId = null,Object? userId = null,Object? timeSpentSec = null,Object? playCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ReadingAttempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,timeSpentSec: null == timeSpentSec ? _self.timeSpentSec : timeSpentSec // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
