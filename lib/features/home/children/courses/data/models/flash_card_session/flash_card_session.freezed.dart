// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flash_card_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlashCardSession {

 int get id; int get flashCardActivityId; int get studentId; DateTime get startedAt; DateTime? get completedAt; int get totalTimeSec; int get cardsCompleted; int get correctAnswers; int get incorrectAnswers; int get score;
/// Create a copy of FlashCardSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashCardSessionCopyWith<FlashCardSession> get copyWith => _$FlashCardSessionCopyWithImpl<FlashCardSession>(this as FlashCardSession, _$identity);

  /// Serializes this FlashCardSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashCardSession&&(identical(other.id, id) || other.id == id)&&(identical(other.flashCardActivityId, flashCardActivityId) || other.flashCardActivityId == flashCardActivityId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalTimeSec, totalTimeSec) || other.totalTimeSec == totalTimeSec)&&(identical(other.cardsCompleted, cardsCompleted) || other.cardsCompleted == cardsCompleted)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flashCardActivityId,studentId,startedAt,completedAt,totalTimeSec,cardsCompleted,correctAnswers,incorrectAnswers,score);

@override
String toString() {
  return 'FlashCardSession(id: $id, flashCardActivityId: $flashCardActivityId, studentId: $studentId, startedAt: $startedAt, completedAt: $completedAt, totalTimeSec: $totalTimeSec, cardsCompleted: $cardsCompleted, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, score: $score)';
}


}

/// @nodoc
abstract mixin class $FlashCardSessionCopyWith<$Res>  {
  factory $FlashCardSessionCopyWith(FlashCardSession value, $Res Function(FlashCardSession) _then) = _$FlashCardSessionCopyWithImpl;
@useResult
$Res call({
 int id, int flashCardActivityId, int studentId, DateTime startedAt, DateTime? completedAt, int totalTimeSec, int cardsCompleted, int correctAnswers, int incorrectAnswers, int score
});




}
/// @nodoc
class _$FlashCardSessionCopyWithImpl<$Res>
    implements $FlashCardSessionCopyWith<$Res> {
  _$FlashCardSessionCopyWithImpl(this._self, this._then);

  final FlashCardSession _self;
  final $Res Function(FlashCardSession) _then;

/// Create a copy of FlashCardSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flashCardActivityId = null,Object? studentId = null,Object? startedAt = null,Object? completedAt = freezed,Object? totalTimeSec = null,Object? cardsCompleted = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? score = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flashCardActivityId: null == flashCardActivityId ? _self.flashCardActivityId : flashCardActivityId // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalTimeSec: null == totalTimeSec ? _self.totalTimeSec : totalTimeSec // ignore: cast_nullable_to_non_nullable
as int,cardsCompleted: null == cardsCompleted ? _self.cardsCompleted : cardsCompleted // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashCardSession].
extension FlashCardSessionPatterns on FlashCardSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashCardSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashCardSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashCardSession value)  $default,){
final _that = this;
switch (_that) {
case _FlashCardSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashCardSession value)?  $default,){
final _that = this;
switch (_that) {
case _FlashCardSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int flashCardActivityId,  int studentId,  DateTime startedAt,  DateTime? completedAt,  int totalTimeSec,  int cardsCompleted,  int correctAnswers,  int incorrectAnswers,  int score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashCardSession() when $default != null:
return $default(_that.id,_that.flashCardActivityId,_that.studentId,_that.startedAt,_that.completedAt,_that.totalTimeSec,_that.cardsCompleted,_that.correctAnswers,_that.incorrectAnswers,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int flashCardActivityId,  int studentId,  DateTime startedAt,  DateTime? completedAt,  int totalTimeSec,  int cardsCompleted,  int correctAnswers,  int incorrectAnswers,  int score)  $default,) {final _that = this;
switch (_that) {
case _FlashCardSession():
return $default(_that.id,_that.flashCardActivityId,_that.studentId,_that.startedAt,_that.completedAt,_that.totalTimeSec,_that.cardsCompleted,_that.correctAnswers,_that.incorrectAnswers,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int flashCardActivityId,  int studentId,  DateTime startedAt,  DateTime? completedAt,  int totalTimeSec,  int cardsCompleted,  int correctAnswers,  int incorrectAnswers,  int score)?  $default,) {final _that = this;
switch (_that) {
case _FlashCardSession() when $default != null:
return $default(_that.id,_that.flashCardActivityId,_that.studentId,_that.startedAt,_that.completedAt,_that.totalTimeSec,_that.cardsCompleted,_that.correctAnswers,_that.incorrectAnswers,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashCardSession implements FlashCardSession {
  const _FlashCardSession({required this.id, required this.flashCardActivityId, required this.studentId, required this.startedAt, required this.completedAt, required this.totalTimeSec, required this.cardsCompleted, required this.correctAnswers, required this.incorrectAnswers, required this.score});
  factory _FlashCardSession.fromJson(Map<String, dynamic> json) => _$FlashCardSessionFromJson(json);

@override final  int id;
@override final  int flashCardActivityId;
@override final  int studentId;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override final  int totalTimeSec;
@override final  int cardsCompleted;
@override final  int correctAnswers;
@override final  int incorrectAnswers;
@override final  int score;

/// Create a copy of FlashCardSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashCardSessionCopyWith<_FlashCardSession> get copyWith => __$FlashCardSessionCopyWithImpl<_FlashCardSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashCardSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashCardSession&&(identical(other.id, id) || other.id == id)&&(identical(other.flashCardActivityId, flashCardActivityId) || other.flashCardActivityId == flashCardActivityId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalTimeSec, totalTimeSec) || other.totalTimeSec == totalTimeSec)&&(identical(other.cardsCompleted, cardsCompleted) || other.cardsCompleted == cardsCompleted)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flashCardActivityId,studentId,startedAt,completedAt,totalTimeSec,cardsCompleted,correctAnswers,incorrectAnswers,score);

@override
String toString() {
  return 'FlashCardSession(id: $id, flashCardActivityId: $flashCardActivityId, studentId: $studentId, startedAt: $startedAt, completedAt: $completedAt, totalTimeSec: $totalTimeSec, cardsCompleted: $cardsCompleted, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, score: $score)';
}


}

/// @nodoc
abstract mixin class _$FlashCardSessionCopyWith<$Res> implements $FlashCardSessionCopyWith<$Res> {
  factory _$FlashCardSessionCopyWith(_FlashCardSession value, $Res Function(_FlashCardSession) _then) = __$FlashCardSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, int flashCardActivityId, int studentId, DateTime startedAt, DateTime? completedAt, int totalTimeSec, int cardsCompleted, int correctAnswers, int incorrectAnswers, int score
});




}
/// @nodoc
class __$FlashCardSessionCopyWithImpl<$Res>
    implements _$FlashCardSessionCopyWith<$Res> {
  __$FlashCardSessionCopyWithImpl(this._self, this._then);

  final _FlashCardSession _self;
  final $Res Function(_FlashCardSession) _then;

/// Create a copy of FlashCardSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flashCardActivityId = null,Object? studentId = null,Object? startedAt = null,Object? completedAt = freezed,Object? totalTimeSec = null,Object? cardsCompleted = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? score = null,}) {
  return _then(_FlashCardSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flashCardActivityId: null == flashCardActivityId ? _self.flashCardActivityId : flashCardActivityId // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalTimeSec: null == totalTimeSec ? _self.totalTimeSec : totalTimeSec // ignore: cast_nullable_to_non_nullable
as int,cardsCompleted: null == cardsCompleted ? _self.cardsCompleted : cardsCompleted // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
