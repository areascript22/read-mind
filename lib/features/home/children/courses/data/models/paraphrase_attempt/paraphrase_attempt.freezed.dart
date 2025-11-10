// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paraphrase_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParaphraseAttemptModel {

 int get id; int get aiReadingId; int get userId; double get similarityScore; double get fluencyScore; double get originalityScore; String get feedback; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ParaphraseAttemptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParaphraseAttemptModelCopyWith<ParaphraseAttemptModel> get copyWith => _$ParaphraseAttemptModelCopyWithImpl<ParaphraseAttemptModel>(this as ParaphraseAttemptModel, _$identity);

  /// Serializes this ParaphraseAttemptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParaphraseAttemptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.similarityScore, similarityScore) || other.similarityScore == similarityScore)&&(identical(other.fluencyScore, fluencyScore) || other.fluencyScore == fluencyScore)&&(identical(other.originalityScore, originalityScore) || other.originalityScore == originalityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aiReadingId,userId,similarityScore,fluencyScore,originalityScore,feedback,createdAt,updatedAt);

@override
String toString() {
  return 'ParaphraseAttemptModel(id: $id, aiReadingId: $aiReadingId, userId: $userId, similarityScore: $similarityScore, fluencyScore: $fluencyScore, originalityScore: $originalityScore, feedback: $feedback, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ParaphraseAttemptModelCopyWith<$Res>  {
  factory $ParaphraseAttemptModelCopyWith(ParaphraseAttemptModel value, $Res Function(ParaphraseAttemptModel) _then) = _$ParaphraseAttemptModelCopyWithImpl;
@useResult
$Res call({
 int id, int aiReadingId, int userId, double similarityScore, double fluencyScore, double originalityScore, String feedback, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ParaphraseAttemptModelCopyWithImpl<$Res>
    implements $ParaphraseAttemptModelCopyWith<$Res> {
  _$ParaphraseAttemptModelCopyWithImpl(this._self, this._then);

  final ParaphraseAttemptModel _self;
  final $Res Function(ParaphraseAttemptModel) _then;

/// Create a copy of ParaphraseAttemptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? aiReadingId = null,Object? userId = null,Object? similarityScore = null,Object? fluencyScore = null,Object? originalityScore = null,Object? feedback = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,similarityScore: null == similarityScore ? _self.similarityScore : similarityScore // ignore: cast_nullable_to_non_nullable
as double,fluencyScore: null == fluencyScore ? _self.fluencyScore : fluencyScore // ignore: cast_nullable_to_non_nullable
as double,originalityScore: null == originalityScore ? _self.originalityScore : originalityScore // ignore: cast_nullable_to_non_nullable
as double,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ParaphraseAttemptModel].
extension ParaphraseAttemptModelPatterns on ParaphraseAttemptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParaphraseAttemptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParaphraseAttemptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParaphraseAttemptModel value)  $default,){
final _that = this;
switch (_that) {
case _ParaphraseAttemptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParaphraseAttemptModel value)?  $default,){
final _that = this;
switch (_that) {
case _ParaphraseAttemptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int aiReadingId,  int userId,  double similarityScore,  double fluencyScore,  double originalityScore,  String feedback,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParaphraseAttemptModel() when $default != null:
return $default(_that.id,_that.aiReadingId,_that.userId,_that.similarityScore,_that.fluencyScore,_that.originalityScore,_that.feedback,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int aiReadingId,  int userId,  double similarityScore,  double fluencyScore,  double originalityScore,  String feedback,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ParaphraseAttemptModel():
return $default(_that.id,_that.aiReadingId,_that.userId,_that.similarityScore,_that.fluencyScore,_that.originalityScore,_that.feedback,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int aiReadingId,  int userId,  double similarityScore,  double fluencyScore,  double originalityScore,  String feedback,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ParaphraseAttemptModel() when $default != null:
return $default(_that.id,_that.aiReadingId,_that.userId,_that.similarityScore,_that.fluencyScore,_that.originalityScore,_that.feedback,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParaphraseAttemptModel implements ParaphraseAttemptModel {
  const _ParaphraseAttemptModel({required this.id, required this.aiReadingId, required this.userId, required this.similarityScore, required this.fluencyScore, required this.originalityScore, required this.feedback, required this.createdAt, required this.updatedAt});
  factory _ParaphraseAttemptModel.fromJson(Map<String, dynamic> json) => _$ParaphraseAttemptModelFromJson(json);

@override final  int id;
@override final  int aiReadingId;
@override final  int userId;
@override final  double similarityScore;
@override final  double fluencyScore;
@override final  double originalityScore;
@override final  String feedback;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ParaphraseAttemptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParaphraseAttemptModelCopyWith<_ParaphraseAttemptModel> get copyWith => __$ParaphraseAttemptModelCopyWithImpl<_ParaphraseAttemptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParaphraseAttemptModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParaphraseAttemptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.similarityScore, similarityScore) || other.similarityScore == similarityScore)&&(identical(other.fluencyScore, fluencyScore) || other.fluencyScore == fluencyScore)&&(identical(other.originalityScore, originalityScore) || other.originalityScore == originalityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aiReadingId,userId,similarityScore,fluencyScore,originalityScore,feedback,createdAt,updatedAt);

@override
String toString() {
  return 'ParaphraseAttemptModel(id: $id, aiReadingId: $aiReadingId, userId: $userId, similarityScore: $similarityScore, fluencyScore: $fluencyScore, originalityScore: $originalityScore, feedback: $feedback, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ParaphraseAttemptModelCopyWith<$Res> implements $ParaphraseAttemptModelCopyWith<$Res> {
  factory _$ParaphraseAttemptModelCopyWith(_ParaphraseAttemptModel value, $Res Function(_ParaphraseAttemptModel) _then) = __$ParaphraseAttemptModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int aiReadingId, int userId, double similarityScore, double fluencyScore, double originalityScore, String feedback, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ParaphraseAttemptModelCopyWithImpl<$Res>
    implements _$ParaphraseAttemptModelCopyWith<$Res> {
  __$ParaphraseAttemptModelCopyWithImpl(this._self, this._then);

  final _ParaphraseAttemptModel _self;
  final $Res Function(_ParaphraseAttemptModel) _then;

/// Create a copy of ParaphraseAttemptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? aiReadingId = null,Object? userId = null,Object? similarityScore = null,Object? fluencyScore = null,Object? originalityScore = null,Object? feedback = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ParaphraseAttemptModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,similarityScore: null == similarityScore ? _self.similarityScore : similarityScore // ignore: cast_nullable_to_non_nullable
as double,fluencyScore: null == fluencyScore ? _self.fluencyScore : fluencyScore // ignore: cast_nullable_to_non_nullable
as double,originalityScore: null == originalityScore ? _self.originalityScore : originalityScore // ignore: cast_nullable_to_non_nullable
as double,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
