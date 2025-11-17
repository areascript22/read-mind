// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_mainidea.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackMainIdea {

@JsonKey(name: 'accuracy_score') int get accuracyScore;@JsonKey(name: 'clarity_score') int get clarityScore;@JsonKey(name: 'conciseness_score') int get concisenessScore; String get feedback;
/// Create a copy of FeedbackMainIdea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackMainIdeaCopyWith<FeedbackMainIdea> get copyWith => _$FeedbackMainIdeaCopyWithImpl<FeedbackMainIdea>(this as FeedbackMainIdea, _$identity);

  /// Serializes this FeedbackMainIdea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackMainIdea&&(identical(other.accuracyScore, accuracyScore) || other.accuracyScore == accuracyScore)&&(identical(other.clarityScore, clarityScore) || other.clarityScore == clarityScore)&&(identical(other.concisenessScore, concisenessScore) || other.concisenessScore == concisenessScore)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accuracyScore,clarityScore,concisenessScore,feedback);

@override
String toString() {
  return 'FeedbackMainIdea(accuracyScore: $accuracyScore, clarityScore: $clarityScore, concisenessScore: $concisenessScore, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $FeedbackMainIdeaCopyWith<$Res>  {
  factory $FeedbackMainIdeaCopyWith(FeedbackMainIdea value, $Res Function(FeedbackMainIdea) _then) = _$FeedbackMainIdeaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'accuracy_score') int accuracyScore,@JsonKey(name: 'clarity_score') int clarityScore,@JsonKey(name: 'conciseness_score') int concisenessScore, String feedback
});




}
/// @nodoc
class _$FeedbackMainIdeaCopyWithImpl<$Res>
    implements $FeedbackMainIdeaCopyWith<$Res> {
  _$FeedbackMainIdeaCopyWithImpl(this._self, this._then);

  final FeedbackMainIdea _self;
  final $Res Function(FeedbackMainIdea) _then;

/// Create a copy of FeedbackMainIdea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accuracyScore = null,Object? clarityScore = null,Object? concisenessScore = null,Object? feedback = null,}) {
  return _then(_self.copyWith(
accuracyScore: null == accuracyScore ? _self.accuracyScore : accuracyScore // ignore: cast_nullable_to_non_nullable
as int,clarityScore: null == clarityScore ? _self.clarityScore : clarityScore // ignore: cast_nullable_to_non_nullable
as int,concisenessScore: null == concisenessScore ? _self.concisenessScore : concisenessScore // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackMainIdea].
extension FeedbackMainIdeaPatterns on FeedbackMainIdea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackMainIdea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackMainIdea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackMainIdea value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackMainIdea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackMainIdea value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackMainIdea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'accuracy_score')  int accuracyScore, @JsonKey(name: 'clarity_score')  int clarityScore, @JsonKey(name: 'conciseness_score')  int concisenessScore,  String feedback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackMainIdea() when $default != null:
return $default(_that.accuracyScore,_that.clarityScore,_that.concisenessScore,_that.feedback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'accuracy_score')  int accuracyScore, @JsonKey(name: 'clarity_score')  int clarityScore, @JsonKey(name: 'conciseness_score')  int concisenessScore,  String feedback)  $default,) {final _that = this;
switch (_that) {
case _FeedbackMainIdea():
return $default(_that.accuracyScore,_that.clarityScore,_that.concisenessScore,_that.feedback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'accuracy_score')  int accuracyScore, @JsonKey(name: 'clarity_score')  int clarityScore, @JsonKey(name: 'conciseness_score')  int concisenessScore,  String feedback)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackMainIdea() when $default != null:
return $default(_that.accuracyScore,_that.clarityScore,_that.concisenessScore,_that.feedback);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackMainIdea implements FeedbackMainIdea {
  const _FeedbackMainIdea({@JsonKey(name: 'accuracy_score') required this.accuracyScore, @JsonKey(name: 'clarity_score') required this.clarityScore, @JsonKey(name: 'conciseness_score') required this.concisenessScore, required this.feedback});
  factory _FeedbackMainIdea.fromJson(Map<String, dynamic> json) => _$FeedbackMainIdeaFromJson(json);

@override@JsonKey(name: 'accuracy_score') final  int accuracyScore;
@override@JsonKey(name: 'clarity_score') final  int clarityScore;
@override@JsonKey(name: 'conciseness_score') final  int concisenessScore;
@override final  String feedback;

/// Create a copy of FeedbackMainIdea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackMainIdeaCopyWith<_FeedbackMainIdea> get copyWith => __$FeedbackMainIdeaCopyWithImpl<_FeedbackMainIdea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackMainIdeaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackMainIdea&&(identical(other.accuracyScore, accuracyScore) || other.accuracyScore == accuracyScore)&&(identical(other.clarityScore, clarityScore) || other.clarityScore == clarityScore)&&(identical(other.concisenessScore, concisenessScore) || other.concisenessScore == concisenessScore)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accuracyScore,clarityScore,concisenessScore,feedback);

@override
String toString() {
  return 'FeedbackMainIdea(accuracyScore: $accuracyScore, clarityScore: $clarityScore, concisenessScore: $concisenessScore, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class _$FeedbackMainIdeaCopyWith<$Res> implements $FeedbackMainIdeaCopyWith<$Res> {
  factory _$FeedbackMainIdeaCopyWith(_FeedbackMainIdea value, $Res Function(_FeedbackMainIdea) _then) = __$FeedbackMainIdeaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'accuracy_score') int accuracyScore,@JsonKey(name: 'clarity_score') int clarityScore,@JsonKey(name: 'conciseness_score') int concisenessScore, String feedback
});




}
/// @nodoc
class __$FeedbackMainIdeaCopyWithImpl<$Res>
    implements _$FeedbackMainIdeaCopyWith<$Res> {
  __$FeedbackMainIdeaCopyWithImpl(this._self, this._then);

  final _FeedbackMainIdea _self;
  final $Res Function(_FeedbackMainIdea) _then;

/// Create a copy of FeedbackMainIdea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accuracyScore = null,Object? clarityScore = null,Object? concisenessScore = null,Object? feedback = null,}) {
  return _then(_FeedbackMainIdea(
accuracyScore: null == accuracyScore ? _self.accuracyScore : accuracyScore // ignore: cast_nullable_to_non_nullable
as int,clarityScore: null == clarityScore ? _self.clarityScore : clarityScore // ignore: cast_nullable_to_non_nullable
as int,concisenessScore: null == concisenessScore ? _self.concisenessScore : concisenessScore // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
