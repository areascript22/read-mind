// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlashcardAttempt {

 int get id; int get sessionId; int get userTranslationId; String get userAnswer; bool get isCorrect; int get timeSpentSec; DateTime get createdAt;
/// Create a copy of FlashcardAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardAttemptCopyWith<FlashcardAttempt> get copyWith => _$FlashcardAttemptCopyWithImpl<FlashcardAttempt>(this as FlashcardAttempt, _$identity);

  /// Serializes this FlashcardAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userTranslationId, userTranslationId) || other.userTranslationId == userTranslationId)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeSpentSec, timeSpentSec) || other.timeSpentSec == timeSpentSec)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,userTranslationId,userAnswer,isCorrect,timeSpentSec,createdAt);

@override
String toString() {
  return 'FlashcardAttempt(id: $id, sessionId: $sessionId, userTranslationId: $userTranslationId, userAnswer: $userAnswer, isCorrect: $isCorrect, timeSpentSec: $timeSpentSec, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FlashcardAttemptCopyWith<$Res>  {
  factory $FlashcardAttemptCopyWith(FlashcardAttempt value, $Res Function(FlashcardAttempt) _then) = _$FlashcardAttemptCopyWithImpl;
@useResult
$Res call({
 int id, int sessionId, int userTranslationId, String userAnswer, bool isCorrect, int timeSpentSec, DateTime createdAt
});




}
/// @nodoc
class _$FlashcardAttemptCopyWithImpl<$Res>
    implements $FlashcardAttemptCopyWith<$Res> {
  _$FlashcardAttemptCopyWithImpl(this._self, this._then);

  final FlashcardAttempt _self;
  final $Res Function(FlashcardAttempt) _then;

/// Create a copy of FlashcardAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? userTranslationId = null,Object? userAnswer = null,Object? isCorrect = null,Object? timeSpentSec = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,userTranslationId: null == userTranslationId ? _self.userTranslationId : userTranslationId // ignore: cast_nullable_to_non_nullable
as int,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeSpentSec: null == timeSpentSec ? _self.timeSpentSec : timeSpentSec // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardAttempt].
extension FlashcardAttemptPatterns on FlashcardAttempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardAttempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardAttempt value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardAttempt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardAttempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sessionId,  int userTranslationId,  String userAnswer,  bool isCorrect,  int timeSpentSec,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardAttempt() when $default != null:
return $default(_that.id,_that.sessionId,_that.userTranslationId,_that.userAnswer,_that.isCorrect,_that.timeSpentSec,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sessionId,  int userTranslationId,  String userAnswer,  bool isCorrect,  int timeSpentSec,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FlashcardAttempt():
return $default(_that.id,_that.sessionId,_that.userTranslationId,_that.userAnswer,_that.isCorrect,_that.timeSpentSec,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sessionId,  int userTranslationId,  String userAnswer,  bool isCorrect,  int timeSpentSec,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardAttempt() when $default != null:
return $default(_that.id,_that.sessionId,_that.userTranslationId,_that.userAnswer,_that.isCorrect,_that.timeSpentSec,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashcardAttempt implements FlashcardAttempt {
  const _FlashcardAttempt({required this.id, required this.sessionId, required this.userTranslationId, required this.userAnswer, required this.isCorrect, required this.timeSpentSec, required this.createdAt});
  factory _FlashcardAttempt.fromJson(Map<String, dynamic> json) => _$FlashcardAttemptFromJson(json);

@override final  int id;
@override final  int sessionId;
@override final  int userTranslationId;
@override final  String userAnswer;
@override final  bool isCorrect;
@override final  int timeSpentSec;
@override final  DateTime createdAt;

/// Create a copy of FlashcardAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardAttemptCopyWith<_FlashcardAttempt> get copyWith => __$FlashcardAttemptCopyWithImpl<_FlashcardAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashcardAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userTranslationId, userTranslationId) || other.userTranslationId == userTranslationId)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeSpentSec, timeSpentSec) || other.timeSpentSec == timeSpentSec)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,userTranslationId,userAnswer,isCorrect,timeSpentSec,createdAt);

@override
String toString() {
  return 'FlashcardAttempt(id: $id, sessionId: $sessionId, userTranslationId: $userTranslationId, userAnswer: $userAnswer, isCorrect: $isCorrect, timeSpentSec: $timeSpentSec, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FlashcardAttemptCopyWith<$Res> implements $FlashcardAttemptCopyWith<$Res> {
  factory _$FlashcardAttemptCopyWith(_FlashcardAttempt value, $Res Function(_FlashcardAttempt) _then) = __$FlashcardAttemptCopyWithImpl;
@override @useResult
$Res call({
 int id, int sessionId, int userTranslationId, String userAnswer, bool isCorrect, int timeSpentSec, DateTime createdAt
});




}
/// @nodoc
class __$FlashcardAttemptCopyWithImpl<$Res>
    implements _$FlashcardAttemptCopyWith<$Res> {
  __$FlashcardAttemptCopyWithImpl(this._self, this._then);

  final _FlashcardAttempt _self;
  final $Res Function(_FlashcardAttempt) _then;

/// Create a copy of FlashcardAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? userTranslationId = null,Object? userAnswer = null,Object? isCorrect = null,Object? timeSpentSec = null,Object? createdAt = null,}) {
  return _then(_FlashcardAttempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,userTranslationId: null == userTranslationId ? _self.userTranslationId : userTranslationId // ignore: cast_nullable_to_non_nullable
as int,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeSpentSec: null == timeSpentSec ? _self.timeSpentSec : timeSpentSec // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
