// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlashcardSession {

 int get id; int get flashCardActivityId; int get studentId; DateTime get startedAt; DateTime? get completedAt; int get totalTimeSec; int get cardsCompleted; int get correctAnswers; int get incorrectAnswers; double? get confidenceScore;
/// Create a copy of FlashcardSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardSessionCopyWith<FlashcardSession> get copyWith => _$FlashcardSessionCopyWithImpl<FlashcardSession>(this as FlashcardSession, _$identity);

  /// Serializes this FlashcardSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardSession&&(identical(other.id, id) || other.id == id)&&(identical(other.flashCardActivityId, flashCardActivityId) || other.flashCardActivityId == flashCardActivityId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalTimeSec, totalTimeSec) || other.totalTimeSec == totalTimeSec)&&(identical(other.cardsCompleted, cardsCompleted) || other.cardsCompleted == cardsCompleted)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flashCardActivityId,studentId,startedAt,completedAt,totalTimeSec,cardsCompleted,correctAnswers,incorrectAnswers,confidenceScore);

@override
String toString() {
  return 'FlashcardSession(id: $id, flashCardActivityId: $flashCardActivityId, studentId: $studentId, startedAt: $startedAt, completedAt: $completedAt, totalTimeSec: $totalTimeSec, cardsCompleted: $cardsCompleted, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class $FlashcardSessionCopyWith<$Res>  {
  factory $FlashcardSessionCopyWith(FlashcardSession value, $Res Function(FlashcardSession) _then) = _$FlashcardSessionCopyWithImpl;
@useResult
$Res call({
 int id, int flashCardActivityId, int studentId, DateTime startedAt, DateTime? completedAt, int totalTimeSec, int cardsCompleted, int correctAnswers, int incorrectAnswers, double? confidenceScore
});




}
/// @nodoc
class _$FlashcardSessionCopyWithImpl<$Res>
    implements $FlashcardSessionCopyWith<$Res> {
  _$FlashcardSessionCopyWithImpl(this._self, this._then);

  final FlashcardSession _self;
  final $Res Function(FlashcardSession) _then;

/// Create a copy of FlashcardSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flashCardActivityId = null,Object? studentId = null,Object? startedAt = null,Object? completedAt = freezed,Object? totalTimeSec = null,Object? cardsCompleted = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? confidenceScore = freezed,}) {
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
as int,confidenceScore: freezed == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardSession].
extension FlashcardSessionPatterns on FlashcardSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardSession value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardSession value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int flashCardActivityId,  int studentId,  DateTime startedAt,  DateTime? completedAt,  int totalTimeSec,  int cardsCompleted,  int correctAnswers,  int incorrectAnswers,  double? confidenceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardSession() when $default != null:
return $default(_that.id,_that.flashCardActivityId,_that.studentId,_that.startedAt,_that.completedAt,_that.totalTimeSec,_that.cardsCompleted,_that.correctAnswers,_that.incorrectAnswers,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int flashCardActivityId,  int studentId,  DateTime startedAt,  DateTime? completedAt,  int totalTimeSec,  int cardsCompleted,  int correctAnswers,  int incorrectAnswers,  double? confidenceScore)  $default,) {final _that = this;
switch (_that) {
case _FlashcardSession():
return $default(_that.id,_that.flashCardActivityId,_that.studentId,_that.startedAt,_that.completedAt,_that.totalTimeSec,_that.cardsCompleted,_that.correctAnswers,_that.incorrectAnswers,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int flashCardActivityId,  int studentId,  DateTime startedAt,  DateTime? completedAt,  int totalTimeSec,  int cardsCompleted,  int correctAnswers,  int incorrectAnswers,  double? confidenceScore)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardSession() when $default != null:
return $default(_that.id,_that.flashCardActivityId,_that.studentId,_that.startedAt,_that.completedAt,_that.totalTimeSec,_that.cardsCompleted,_that.correctAnswers,_that.incorrectAnswers,_that.confidenceScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashcardSession implements FlashcardSession {
  const _FlashcardSession({required this.id, required this.flashCardActivityId, required this.studentId, required this.startedAt, this.completedAt, required this.totalTimeSec, required this.cardsCompleted, required this.correctAnswers, required this.incorrectAnswers, this.confidenceScore});
  factory _FlashcardSession.fromJson(Map<String, dynamic> json) => _$FlashcardSessionFromJson(json);

@override final  int id;
@override final  int flashCardActivityId;
@override final  int studentId;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override final  int totalTimeSec;
@override final  int cardsCompleted;
@override final  int correctAnswers;
@override final  int incorrectAnswers;
@override final  double? confidenceScore;

/// Create a copy of FlashcardSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardSessionCopyWith<_FlashcardSession> get copyWith => __$FlashcardSessionCopyWithImpl<_FlashcardSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashcardSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardSession&&(identical(other.id, id) || other.id == id)&&(identical(other.flashCardActivityId, flashCardActivityId) || other.flashCardActivityId == flashCardActivityId)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalTimeSec, totalTimeSec) || other.totalTimeSec == totalTimeSec)&&(identical(other.cardsCompleted, cardsCompleted) || other.cardsCompleted == cardsCompleted)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flashCardActivityId,studentId,startedAt,completedAt,totalTimeSec,cardsCompleted,correctAnswers,incorrectAnswers,confidenceScore);

@override
String toString() {
  return 'FlashcardSession(id: $id, flashCardActivityId: $flashCardActivityId, studentId: $studentId, startedAt: $startedAt, completedAt: $completedAt, totalTimeSec: $totalTimeSec, cardsCompleted: $cardsCompleted, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class _$FlashcardSessionCopyWith<$Res> implements $FlashcardSessionCopyWith<$Res> {
  factory _$FlashcardSessionCopyWith(_FlashcardSession value, $Res Function(_FlashcardSession) _then) = __$FlashcardSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, int flashCardActivityId, int studentId, DateTime startedAt, DateTime? completedAt, int totalTimeSec, int cardsCompleted, int correctAnswers, int incorrectAnswers, double? confidenceScore
});




}
/// @nodoc
class __$FlashcardSessionCopyWithImpl<$Res>
    implements _$FlashcardSessionCopyWith<$Res> {
  __$FlashcardSessionCopyWithImpl(this._self, this._then);

  final _FlashcardSession _self;
  final $Res Function(_FlashcardSession) _then;

/// Create a copy of FlashcardSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flashCardActivityId = null,Object? studentId = null,Object? startedAt = null,Object? completedAt = freezed,Object? totalTimeSec = null,Object? cardsCompleted = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? confidenceScore = freezed,}) {
  return _then(_FlashcardSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flashCardActivityId: null == flashCardActivityId ? _self.flashCardActivityId : flashCardActivityId // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalTimeSec: null == totalTimeSec ? _self.totalTimeSec : totalTimeSec // ignore: cast_nullable_to_non_nullable
as int,cardsCompleted: null == cardsCompleted ? _self.cardsCompleted : cardsCompleted // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,confidenceScore: freezed == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
