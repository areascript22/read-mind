// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackSummary {

@JsonKey(name: 'accuracy_score') int get accuracyScore;@JsonKey(name: 'coverage_score') int get coverageScore;@JsonKey(name: 'clarity_score') int get clarityScore; String get feedback;
/// Create a copy of FeedbackSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackSummaryCopyWith<FeedbackSummary> get copyWith => _$FeedbackSummaryCopyWithImpl<FeedbackSummary>(this as FeedbackSummary, _$identity);

  /// Serializes this FeedbackSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackSummary&&(identical(other.accuracyScore, accuracyScore) || other.accuracyScore == accuracyScore)&&(identical(other.coverageScore, coverageScore) || other.coverageScore == coverageScore)&&(identical(other.clarityScore, clarityScore) || other.clarityScore == clarityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accuracyScore,coverageScore,clarityScore,feedback);

@override
String toString() {
  return 'FeedbackSummary(accuracyScore: $accuracyScore, coverageScore: $coverageScore, clarityScore: $clarityScore, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $FeedbackSummaryCopyWith<$Res>  {
  factory $FeedbackSummaryCopyWith(FeedbackSummary value, $Res Function(FeedbackSummary) _then) = _$FeedbackSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'accuracy_score') int accuracyScore,@JsonKey(name: 'coverage_score') int coverageScore,@JsonKey(name: 'clarity_score') int clarityScore, String feedback
});




}
/// @nodoc
class _$FeedbackSummaryCopyWithImpl<$Res>
    implements $FeedbackSummaryCopyWith<$Res> {
  _$FeedbackSummaryCopyWithImpl(this._self, this._then);

  final FeedbackSummary _self;
  final $Res Function(FeedbackSummary) _then;

/// Create a copy of FeedbackSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accuracyScore = null,Object? coverageScore = null,Object? clarityScore = null,Object? feedback = null,}) {
  return _then(_self.copyWith(
accuracyScore: null == accuracyScore ? _self.accuracyScore : accuracyScore // ignore: cast_nullable_to_non_nullable
as int,coverageScore: null == coverageScore ? _self.coverageScore : coverageScore // ignore: cast_nullable_to_non_nullable
as int,clarityScore: null == clarityScore ? _self.clarityScore : clarityScore // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackSummary].
extension FeedbackSummaryPatterns on FeedbackSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackSummary value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackSummary value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'accuracy_score')  int accuracyScore, @JsonKey(name: 'coverage_score')  int coverageScore, @JsonKey(name: 'clarity_score')  int clarityScore,  String feedback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackSummary() when $default != null:
return $default(_that.accuracyScore,_that.coverageScore,_that.clarityScore,_that.feedback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'accuracy_score')  int accuracyScore, @JsonKey(name: 'coverage_score')  int coverageScore, @JsonKey(name: 'clarity_score')  int clarityScore,  String feedback)  $default,) {final _that = this;
switch (_that) {
case _FeedbackSummary():
return $default(_that.accuracyScore,_that.coverageScore,_that.clarityScore,_that.feedback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'accuracy_score')  int accuracyScore, @JsonKey(name: 'coverage_score')  int coverageScore, @JsonKey(name: 'clarity_score')  int clarityScore,  String feedback)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackSummary() when $default != null:
return $default(_that.accuracyScore,_that.coverageScore,_that.clarityScore,_that.feedback);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackSummary implements FeedbackSummary {
  const _FeedbackSummary({@JsonKey(name: 'accuracy_score') required this.accuracyScore, @JsonKey(name: 'coverage_score') required this.coverageScore, @JsonKey(name: 'clarity_score') required this.clarityScore, required this.feedback});
  factory _FeedbackSummary.fromJson(Map<String, dynamic> json) => _$FeedbackSummaryFromJson(json);

@override@JsonKey(name: 'accuracy_score') final  int accuracyScore;
@override@JsonKey(name: 'coverage_score') final  int coverageScore;
@override@JsonKey(name: 'clarity_score') final  int clarityScore;
@override final  String feedback;

/// Create a copy of FeedbackSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackSummaryCopyWith<_FeedbackSummary> get copyWith => __$FeedbackSummaryCopyWithImpl<_FeedbackSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackSummary&&(identical(other.accuracyScore, accuracyScore) || other.accuracyScore == accuracyScore)&&(identical(other.coverageScore, coverageScore) || other.coverageScore == coverageScore)&&(identical(other.clarityScore, clarityScore) || other.clarityScore == clarityScore)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accuracyScore,coverageScore,clarityScore,feedback);

@override
String toString() {
  return 'FeedbackSummary(accuracyScore: $accuracyScore, coverageScore: $coverageScore, clarityScore: $clarityScore, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class _$FeedbackSummaryCopyWith<$Res> implements $FeedbackSummaryCopyWith<$Res> {
  factory _$FeedbackSummaryCopyWith(_FeedbackSummary value, $Res Function(_FeedbackSummary) _then) = __$FeedbackSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'accuracy_score') int accuracyScore,@JsonKey(name: 'coverage_score') int coverageScore,@JsonKey(name: 'clarity_score') int clarityScore, String feedback
});




}
/// @nodoc
class __$FeedbackSummaryCopyWithImpl<$Res>
    implements _$FeedbackSummaryCopyWith<$Res> {
  __$FeedbackSummaryCopyWithImpl(this._self, this._then);

  final _FeedbackSummary _self;
  final $Res Function(_FeedbackSummary) _then;

/// Create a copy of FeedbackSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accuracyScore = null,Object? coverageScore = null,Object? clarityScore = null,Object? feedback = null,}) {
  return _then(_FeedbackSummary(
accuracyScore: null == accuracyScore ? _self.accuracyScore : accuracyScore // ignore: cast_nullable_to_non_nullable
as int,coverageScore: null == coverageScore ? _self.coverageScore : coverageScore // ignore: cast_nullable_to_non_nullable
as int,clarityScore: null == clarityScore ? _self.clarityScore : clarityScore // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
