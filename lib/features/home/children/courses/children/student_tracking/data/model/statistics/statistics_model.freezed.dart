// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatisticsModel {

 int get total; int get completed; int get inProgress; int get notStarted; double get averageScore; int get totalActivitiesWithScoring; int get completionRate;
/// Create a copy of StatisticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsModelCopyWith<StatisticsModel> get copyWith => _$StatisticsModelCopyWithImpl<StatisticsModel>(this as StatisticsModel, _$identity);

  /// Serializes this StatisticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsModel&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.notStarted, notStarted) || other.notStarted == notStarted)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.totalActivitiesWithScoring, totalActivitiesWithScoring) || other.totalActivitiesWithScoring == totalActivitiesWithScoring)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,completed,inProgress,notStarted,averageScore,totalActivitiesWithScoring,completionRate);

@override
String toString() {
  return 'StatisticsModel(total: $total, completed: $completed, inProgress: $inProgress, notStarted: $notStarted, averageScore: $averageScore, totalActivitiesWithScoring: $totalActivitiesWithScoring, completionRate: $completionRate)';
}


}

/// @nodoc
abstract mixin class $StatisticsModelCopyWith<$Res>  {
  factory $StatisticsModelCopyWith(StatisticsModel value, $Res Function(StatisticsModel) _then) = _$StatisticsModelCopyWithImpl;
@useResult
$Res call({
 int total, int completed, int inProgress, int notStarted, double averageScore, int totalActivitiesWithScoring, int completionRate
});




}
/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._self, this._then);

  final StatisticsModel _self;
  final $Res Function(StatisticsModel) _then;

/// Create a copy of StatisticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? completed = null,Object? inProgress = null,Object? notStarted = null,Object? averageScore = null,Object? totalActivitiesWithScoring = null,Object? completionRate = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int,notStarted: null == notStarted ? _self.notStarted : notStarted // ignore: cast_nullable_to_non_nullable
as int,averageScore: null == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as double,totalActivitiesWithScoring: null == totalActivitiesWithScoring ? _self.totalActivitiesWithScoring : totalActivitiesWithScoring // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StatisticsModel].
extension StatisticsModelPatterns on StatisticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatisticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatisticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatisticsModel value)  $default,){
final _that = this;
switch (_that) {
case _StatisticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatisticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatisticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int completed,  int inProgress,  int notStarted,  double averageScore,  int totalActivitiesWithScoring,  int completionRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatisticsModel() when $default != null:
return $default(_that.total,_that.completed,_that.inProgress,_that.notStarted,_that.averageScore,_that.totalActivitiesWithScoring,_that.completionRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int completed,  int inProgress,  int notStarted,  double averageScore,  int totalActivitiesWithScoring,  int completionRate)  $default,) {final _that = this;
switch (_that) {
case _StatisticsModel():
return $default(_that.total,_that.completed,_that.inProgress,_that.notStarted,_that.averageScore,_that.totalActivitiesWithScoring,_that.completionRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int completed,  int inProgress,  int notStarted,  double averageScore,  int totalActivitiesWithScoring,  int completionRate)?  $default,) {final _that = this;
switch (_that) {
case _StatisticsModel() when $default != null:
return $default(_that.total,_that.completed,_that.inProgress,_that.notStarted,_that.averageScore,_that.totalActivitiesWithScoring,_that.completionRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatisticsModel implements StatisticsModel {
  const _StatisticsModel({required this.total, required this.completed, required this.inProgress, required this.notStarted, required this.averageScore, required this.totalActivitiesWithScoring, required this.completionRate});
  factory _StatisticsModel.fromJson(Map<String, dynamic> json) => _$StatisticsModelFromJson(json);

@override final  int total;
@override final  int completed;
@override final  int inProgress;
@override final  int notStarted;
@override final  double averageScore;
@override final  int totalActivitiesWithScoring;
@override final  int completionRate;

/// Create a copy of StatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsModelCopyWith<_StatisticsModel> get copyWith => __$StatisticsModelCopyWithImpl<_StatisticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatisticsModel&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.notStarted, notStarted) || other.notStarted == notStarted)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.totalActivitiesWithScoring, totalActivitiesWithScoring) || other.totalActivitiesWithScoring == totalActivitiesWithScoring)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,completed,inProgress,notStarted,averageScore,totalActivitiesWithScoring,completionRate);

@override
String toString() {
  return 'StatisticsModel(total: $total, completed: $completed, inProgress: $inProgress, notStarted: $notStarted, averageScore: $averageScore, totalActivitiesWithScoring: $totalActivitiesWithScoring, completionRate: $completionRate)';
}


}

/// @nodoc
abstract mixin class _$StatisticsModelCopyWith<$Res> implements $StatisticsModelCopyWith<$Res> {
  factory _$StatisticsModelCopyWith(_StatisticsModel value, $Res Function(_StatisticsModel) _then) = __$StatisticsModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int completed, int inProgress, int notStarted, double averageScore, int totalActivitiesWithScoring, int completionRate
});




}
/// @nodoc
class __$StatisticsModelCopyWithImpl<$Res>
    implements _$StatisticsModelCopyWith<$Res> {
  __$StatisticsModelCopyWithImpl(this._self, this._then);

  final _StatisticsModel _self;
  final $Res Function(_StatisticsModel) _then;

/// Create a copy of StatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? completed = null,Object? inProgress = null,Object? notStarted = null,Object? averageScore = null,Object? totalActivitiesWithScoring = null,Object? completionRate = null,}) {
  return _then(_StatisticsModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int,notStarted: null == notStarted ? _self.notStarted : notStarted // ignore: cast_nullable_to_non_nullable
as int,averageScore: null == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as double,totalActivitiesWithScoring: null == totalActivitiesWithScoring ? _self.totalActivitiesWithScoring : totalActivitiesWithScoring // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
