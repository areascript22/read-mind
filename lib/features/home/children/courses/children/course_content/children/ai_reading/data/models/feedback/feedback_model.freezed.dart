// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackModel {

@JsonKey(name: 'similarity_score') int get similarityScore;@JsonKey(name: 'fluency_score') int get fluencyScore;@JsonKey(name: 'originality_score') int get originalityScore; String get feedback;
/// Create a copy of FeedbackModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackModelCopyWith<FeedbackModel> get copyWith => _$FeedbackModelCopyWithImpl<FeedbackModel>(this as FeedbackModel, _$identity);

  /// Serializes this FeedbackModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackModel&&(identical(other.similarityScore, similarityScore) || other.similarityScore == similarityScore)&&(identical(other.fluencyScore, fluencyScore) || other.fluencyScore == fluencyScore)&&(identical(other.originalityScore, originalityScore) || other.originalityScore == originalityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,similarityScore,fluencyScore,originalityScore,feedback);

@override
String toString() {
  return 'FeedbackModel(similarityScore: $similarityScore, fluencyScore: $fluencyScore, originalityScore: $originalityScore, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $FeedbackModelCopyWith<$Res>  {
  factory $FeedbackModelCopyWith(FeedbackModel value, $Res Function(FeedbackModel) _then) = _$FeedbackModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'similarity_score') int similarityScore,@JsonKey(name: 'fluency_score') int fluencyScore,@JsonKey(name: 'originality_score') int originalityScore, String feedback
});




}
/// @nodoc
class _$FeedbackModelCopyWithImpl<$Res>
    implements $FeedbackModelCopyWith<$Res> {
  _$FeedbackModelCopyWithImpl(this._self, this._then);

  final FeedbackModel _self;
  final $Res Function(FeedbackModel) _then;

/// Create a copy of FeedbackModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? similarityScore = null,Object? fluencyScore = null,Object? originalityScore = null,Object? feedback = null,}) {
  return _then(_self.copyWith(
similarityScore: null == similarityScore ? _self.similarityScore : similarityScore // ignore: cast_nullable_to_non_nullable
as int,fluencyScore: null == fluencyScore ? _self.fluencyScore : fluencyScore // ignore: cast_nullable_to_non_nullable
as int,originalityScore: null == originalityScore ? _self.originalityScore : originalityScore // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackModel].
extension FeedbackModelPatterns on FeedbackModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'similarity_score')  int similarityScore, @JsonKey(name: 'fluency_score')  int fluencyScore, @JsonKey(name: 'originality_score')  int originalityScore,  String feedback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackModel() when $default != null:
return $default(_that.similarityScore,_that.fluencyScore,_that.originalityScore,_that.feedback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'similarity_score')  int similarityScore, @JsonKey(name: 'fluency_score')  int fluencyScore, @JsonKey(name: 'originality_score')  int originalityScore,  String feedback)  $default,) {final _that = this;
switch (_that) {
case _FeedbackModel():
return $default(_that.similarityScore,_that.fluencyScore,_that.originalityScore,_that.feedback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'similarity_score')  int similarityScore, @JsonKey(name: 'fluency_score')  int fluencyScore, @JsonKey(name: 'originality_score')  int originalityScore,  String feedback)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackModel() when $default != null:
return $default(_that.similarityScore,_that.fluencyScore,_that.originalityScore,_that.feedback);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackModel implements FeedbackModel {
  const _FeedbackModel({@JsonKey(name: 'similarity_score') required this.similarityScore, @JsonKey(name: 'fluency_score') required this.fluencyScore, @JsonKey(name: 'originality_score') required this.originalityScore, required this.feedback});
  factory _FeedbackModel.fromJson(Map<String, dynamic> json) => _$FeedbackModelFromJson(json);

@override@JsonKey(name: 'similarity_score') final  int similarityScore;
@override@JsonKey(name: 'fluency_score') final  int fluencyScore;
@override@JsonKey(name: 'originality_score') final  int originalityScore;
@override final  String feedback;

/// Create a copy of FeedbackModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackModelCopyWith<_FeedbackModel> get copyWith => __$FeedbackModelCopyWithImpl<_FeedbackModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackModel&&(identical(other.similarityScore, similarityScore) || other.similarityScore == similarityScore)&&(identical(other.fluencyScore, fluencyScore) || other.fluencyScore == fluencyScore)&&(identical(other.originalityScore, originalityScore) || other.originalityScore == originalityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,similarityScore,fluencyScore,originalityScore,feedback);

@override
String toString() {
  return 'FeedbackModel(similarityScore: $similarityScore, fluencyScore: $fluencyScore, originalityScore: $originalityScore, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class _$FeedbackModelCopyWith<$Res> implements $FeedbackModelCopyWith<$Res> {
  factory _$FeedbackModelCopyWith(_FeedbackModel value, $Res Function(_FeedbackModel) _then) = __$FeedbackModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'similarity_score') int similarityScore,@JsonKey(name: 'fluency_score') int fluencyScore,@JsonKey(name: 'originality_score') int originalityScore, String feedback
});




}
/// @nodoc
class __$FeedbackModelCopyWithImpl<$Res>
    implements _$FeedbackModelCopyWith<$Res> {
  __$FeedbackModelCopyWithImpl(this._self, this._then);

  final _FeedbackModel _self;
  final $Res Function(_FeedbackModel) _then;

/// Create a copy of FeedbackModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? similarityScore = null,Object? fluencyScore = null,Object? originalityScore = null,Object? feedback = null,}) {
  return _then(_FeedbackModel(
similarityScore: null == similarityScore ? _self.similarityScore : similarityScore // ignore: cast_nullable_to_non_nullable
as int,fluencyScore: null == fluencyScore ? _self.fluencyScore : fluencyScore // ignore: cast_nullable_to_non_nullable
as int,originalityScore: null == originalityScore ? _self.originalityScore : originalityScore // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
