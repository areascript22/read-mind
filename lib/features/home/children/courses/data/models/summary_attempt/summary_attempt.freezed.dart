// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummaryAttemptModel {

 int get id; int get aiReadingId; int get userId; double get accuracyScore; double get coverageScore; double get clarityScore; String get feedback; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SummaryAttemptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryAttemptModelCopyWith<SummaryAttemptModel> get copyWith => _$SummaryAttemptModelCopyWithImpl<SummaryAttemptModel>(this as SummaryAttemptModel, _$identity);

  /// Serializes this SummaryAttemptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryAttemptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.accuracyScore, accuracyScore) || other.accuracyScore == accuracyScore)&&(identical(other.coverageScore, coverageScore) || other.coverageScore == coverageScore)&&(identical(other.clarityScore, clarityScore) || other.clarityScore == clarityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aiReadingId,userId,accuracyScore,coverageScore,clarityScore,feedback,createdAt,updatedAt);

@override
String toString() {
  return 'SummaryAttemptModel(id: $id, aiReadingId: $aiReadingId, userId: $userId, accuracyScore: $accuracyScore, coverageScore: $coverageScore, clarityScore: $clarityScore, feedback: $feedback, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SummaryAttemptModelCopyWith<$Res>  {
  factory $SummaryAttemptModelCopyWith(SummaryAttemptModel value, $Res Function(SummaryAttemptModel) _then) = _$SummaryAttemptModelCopyWithImpl;
@useResult
$Res call({
 int id, int aiReadingId, int userId, double accuracyScore, double coverageScore, double clarityScore, String feedback, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SummaryAttemptModelCopyWithImpl<$Res>
    implements $SummaryAttemptModelCopyWith<$Res> {
  _$SummaryAttemptModelCopyWithImpl(this._self, this._then);

  final SummaryAttemptModel _self;
  final $Res Function(SummaryAttemptModel) _then;

/// Create a copy of SummaryAttemptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? aiReadingId = null,Object? userId = null,Object? accuracyScore = null,Object? coverageScore = null,Object? clarityScore = null,Object? feedback = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,accuracyScore: null == accuracyScore ? _self.accuracyScore : accuracyScore // ignore: cast_nullable_to_non_nullable
as double,coverageScore: null == coverageScore ? _self.coverageScore : coverageScore // ignore: cast_nullable_to_non_nullable
as double,clarityScore: null == clarityScore ? _self.clarityScore : clarityScore // ignore: cast_nullable_to_non_nullable
as double,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryAttemptModel].
extension SummaryAttemptModelPatterns on SummaryAttemptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryAttemptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryAttemptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryAttemptModel value)  $default,){
final _that = this;
switch (_that) {
case _SummaryAttemptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryAttemptModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryAttemptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int aiReadingId,  int userId,  double accuracyScore,  double coverageScore,  double clarityScore,  String feedback,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryAttemptModel() when $default != null:
return $default(_that.id,_that.aiReadingId,_that.userId,_that.accuracyScore,_that.coverageScore,_that.clarityScore,_that.feedback,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int aiReadingId,  int userId,  double accuracyScore,  double coverageScore,  double clarityScore,  String feedback,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SummaryAttemptModel():
return $default(_that.id,_that.aiReadingId,_that.userId,_that.accuracyScore,_that.coverageScore,_that.clarityScore,_that.feedback,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int aiReadingId,  int userId,  double accuracyScore,  double coverageScore,  double clarityScore,  String feedback,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SummaryAttemptModel() when $default != null:
return $default(_that.id,_that.aiReadingId,_that.userId,_that.accuracyScore,_that.coverageScore,_that.clarityScore,_that.feedback,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryAttemptModel implements SummaryAttemptModel {
  const _SummaryAttemptModel({required this.id, required this.aiReadingId, required this.userId, required this.accuracyScore, required this.coverageScore, required this.clarityScore, required this.feedback, required this.createdAt, required this.updatedAt});
  factory _SummaryAttemptModel.fromJson(Map<String, dynamic> json) => _$SummaryAttemptModelFromJson(json);

@override final  int id;
@override final  int aiReadingId;
@override final  int userId;
@override final  double accuracyScore;
@override final  double coverageScore;
@override final  double clarityScore;
@override final  String feedback;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SummaryAttemptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryAttemptModelCopyWith<_SummaryAttemptModel> get copyWith => __$SummaryAttemptModelCopyWithImpl<_SummaryAttemptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryAttemptModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryAttemptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.accuracyScore, accuracyScore) || other.accuracyScore == accuracyScore)&&(identical(other.coverageScore, coverageScore) || other.coverageScore == coverageScore)&&(identical(other.clarityScore, clarityScore) || other.clarityScore == clarityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,aiReadingId,userId,accuracyScore,coverageScore,clarityScore,feedback,createdAt,updatedAt);

@override
String toString() {
  return 'SummaryAttemptModel(id: $id, aiReadingId: $aiReadingId, userId: $userId, accuracyScore: $accuracyScore, coverageScore: $coverageScore, clarityScore: $clarityScore, feedback: $feedback, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SummaryAttemptModelCopyWith<$Res> implements $SummaryAttemptModelCopyWith<$Res> {
  factory _$SummaryAttemptModelCopyWith(_SummaryAttemptModel value, $Res Function(_SummaryAttemptModel) _then) = __$SummaryAttemptModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int aiReadingId, int userId, double accuracyScore, double coverageScore, double clarityScore, String feedback, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SummaryAttemptModelCopyWithImpl<$Res>
    implements _$SummaryAttemptModelCopyWith<$Res> {
  __$SummaryAttemptModelCopyWithImpl(this._self, this._then);

  final _SummaryAttemptModel _self;
  final $Res Function(_SummaryAttemptModel) _then;

/// Create a copy of SummaryAttemptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? aiReadingId = null,Object? userId = null,Object? accuracyScore = null,Object? coverageScore = null,Object? clarityScore = null,Object? feedback = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SummaryAttemptModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,accuracyScore: null == accuracyScore ? _self.accuracyScore : accuracyScore // ignore: cast_nullable_to_non_nullable
as double,coverageScore: null == coverageScore ? _self.coverageScore : coverageScore // ignore: cast_nullable_to_non_nullable
as double,clarityScore: null == clarityScore ? _self.clarityScore : clarityScore // ignore: cast_nullable_to_non_nullable
as double,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
