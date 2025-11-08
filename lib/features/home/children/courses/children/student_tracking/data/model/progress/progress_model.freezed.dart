// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressModel {

 int get progressId; int get activityId; String get title; String? get description; String get courseName; bool get completed; int get totalProgress; int get totalScore; bool get hasScoring; int? get maxScore; String get dueDate; String get updatedAt; SubactivitiesCompletedModel get subactivitiesCompleted; int get subactivitiesCompletionRate;
/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressModelCopyWith<ProgressModel> get copyWith => _$ProgressModelCopyWithImpl<ProgressModel>(this as ProgressModel, _$identity);

  /// Serializes this ProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressModel&&(identical(other.progressId, progressId) || other.progressId == progressId)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.hasScoring, hasScoring) || other.hasScoring == hasScoring)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.subactivitiesCompleted, subactivitiesCompleted) || other.subactivitiesCompleted == subactivitiesCompleted)&&(identical(other.subactivitiesCompletionRate, subactivitiesCompletionRate) || other.subactivitiesCompletionRate == subactivitiesCompletionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progressId,activityId,title,description,courseName,completed,totalProgress,totalScore,hasScoring,maxScore,dueDate,updatedAt,subactivitiesCompleted,subactivitiesCompletionRate);

@override
String toString() {
  return 'ProgressModel(progressId: $progressId, activityId: $activityId, title: $title, description: $description, courseName: $courseName, completed: $completed, totalProgress: $totalProgress, totalScore: $totalScore, hasScoring: $hasScoring, maxScore: $maxScore, dueDate: $dueDate, updatedAt: $updatedAt, subactivitiesCompleted: $subactivitiesCompleted, subactivitiesCompletionRate: $subactivitiesCompletionRate)';
}


}

/// @nodoc
abstract mixin class $ProgressModelCopyWith<$Res>  {
  factory $ProgressModelCopyWith(ProgressModel value, $Res Function(ProgressModel) _then) = _$ProgressModelCopyWithImpl;
@useResult
$Res call({
 int progressId, int activityId, String title, String? description, String courseName, bool completed, int totalProgress, int totalScore, bool hasScoring, int? maxScore, String dueDate, String updatedAt, SubactivitiesCompletedModel subactivitiesCompleted, int subactivitiesCompletionRate
});


$SubactivitiesCompletedModelCopyWith<$Res> get subactivitiesCompleted;

}
/// @nodoc
class _$ProgressModelCopyWithImpl<$Res>
    implements $ProgressModelCopyWith<$Res> {
  _$ProgressModelCopyWithImpl(this._self, this._then);

  final ProgressModel _self;
  final $Res Function(ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progressId = null,Object? activityId = null,Object? title = null,Object? description = freezed,Object? courseName = null,Object? completed = null,Object? totalProgress = null,Object? totalScore = null,Object? hasScoring = null,Object? maxScore = freezed,Object? dueDate = null,Object? updatedAt = null,Object? subactivitiesCompleted = null,Object? subactivitiesCompletionRate = null,}) {
  return _then(_self.copyWith(
progressId: null == progressId ? _self.progressId : progressId // ignore: cast_nullable_to_non_nullable
as int,activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,totalProgress: null == totalProgress ? _self.totalProgress : totalProgress // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,hasScoring: null == hasScoring ? _self.hasScoring : hasScoring // ignore: cast_nullable_to_non_nullable
as bool,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,subactivitiesCompleted: null == subactivitiesCompleted ? _self.subactivitiesCompleted : subactivitiesCompleted // ignore: cast_nullable_to_non_nullable
as SubactivitiesCompletedModel,subactivitiesCompletionRate: null == subactivitiesCompletionRate ? _self.subactivitiesCompletionRate : subactivitiesCompletionRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubactivitiesCompletedModelCopyWith<$Res> get subactivitiesCompleted {
  
  return $SubactivitiesCompletedModelCopyWith<$Res>(_self.subactivitiesCompleted, (value) {
    return _then(_self.copyWith(subactivitiesCompleted: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgressModel].
extension ProgressModelPatterns on ProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int progressId,  int activityId,  String title,  String? description,  String courseName,  bool completed,  int totalProgress,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String updatedAt,  SubactivitiesCompletedModel subactivitiesCompleted,  int subactivitiesCompletionRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
return $default(_that.progressId,_that.activityId,_that.title,_that.description,_that.courseName,_that.completed,_that.totalProgress,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.updatedAt,_that.subactivitiesCompleted,_that.subactivitiesCompletionRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int progressId,  int activityId,  String title,  String? description,  String courseName,  bool completed,  int totalProgress,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String updatedAt,  SubactivitiesCompletedModel subactivitiesCompleted,  int subactivitiesCompletionRate)  $default,) {final _that = this;
switch (_that) {
case _ProgressModel():
return $default(_that.progressId,_that.activityId,_that.title,_that.description,_that.courseName,_that.completed,_that.totalProgress,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.updatedAt,_that.subactivitiesCompleted,_that.subactivitiesCompletionRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int progressId,  int activityId,  String title,  String? description,  String courseName,  bool completed,  int totalProgress,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String updatedAt,  SubactivitiesCompletedModel subactivitiesCompleted,  int subactivitiesCompletionRate)?  $default,) {final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
return $default(_that.progressId,_that.activityId,_that.title,_that.description,_that.courseName,_that.completed,_that.totalProgress,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.updatedAt,_that.subactivitiesCompleted,_that.subactivitiesCompletionRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressModel implements ProgressModel {
  const _ProgressModel({required this.progressId, required this.activityId, required this.title, required this.description, required this.courseName, required this.completed, required this.totalProgress, required this.totalScore, required this.hasScoring, required this.maxScore, required this.dueDate, required this.updatedAt, required this.subactivitiesCompleted, required this.subactivitiesCompletionRate});
  factory _ProgressModel.fromJson(Map<String, dynamic> json) => _$ProgressModelFromJson(json);

@override final  int progressId;
@override final  int activityId;
@override final  String title;
@override final  String? description;
@override final  String courseName;
@override final  bool completed;
@override final  int totalProgress;
@override final  int totalScore;
@override final  bool hasScoring;
@override final  int? maxScore;
@override final  String dueDate;
@override final  String updatedAt;
@override final  SubactivitiesCompletedModel subactivitiesCompleted;
@override final  int subactivitiesCompletionRate;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressModelCopyWith<_ProgressModel> get copyWith => __$ProgressModelCopyWithImpl<_ProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressModel&&(identical(other.progressId, progressId) || other.progressId == progressId)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.hasScoring, hasScoring) || other.hasScoring == hasScoring)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.subactivitiesCompleted, subactivitiesCompleted) || other.subactivitiesCompleted == subactivitiesCompleted)&&(identical(other.subactivitiesCompletionRate, subactivitiesCompletionRate) || other.subactivitiesCompletionRate == subactivitiesCompletionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progressId,activityId,title,description,courseName,completed,totalProgress,totalScore,hasScoring,maxScore,dueDate,updatedAt,subactivitiesCompleted,subactivitiesCompletionRate);

@override
String toString() {
  return 'ProgressModel(progressId: $progressId, activityId: $activityId, title: $title, description: $description, courseName: $courseName, completed: $completed, totalProgress: $totalProgress, totalScore: $totalScore, hasScoring: $hasScoring, maxScore: $maxScore, dueDate: $dueDate, updatedAt: $updatedAt, subactivitiesCompleted: $subactivitiesCompleted, subactivitiesCompletionRate: $subactivitiesCompletionRate)';
}


}

/// @nodoc
abstract mixin class _$ProgressModelCopyWith<$Res> implements $ProgressModelCopyWith<$Res> {
  factory _$ProgressModelCopyWith(_ProgressModel value, $Res Function(_ProgressModel) _then) = __$ProgressModelCopyWithImpl;
@override @useResult
$Res call({
 int progressId, int activityId, String title, String? description, String courseName, bool completed, int totalProgress, int totalScore, bool hasScoring, int? maxScore, String dueDate, String updatedAt, SubactivitiesCompletedModel subactivitiesCompleted, int subactivitiesCompletionRate
});


@override $SubactivitiesCompletedModelCopyWith<$Res> get subactivitiesCompleted;

}
/// @nodoc
class __$ProgressModelCopyWithImpl<$Res>
    implements _$ProgressModelCopyWith<$Res> {
  __$ProgressModelCopyWithImpl(this._self, this._then);

  final _ProgressModel _self;
  final $Res Function(_ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progressId = null,Object? activityId = null,Object? title = null,Object? description = freezed,Object? courseName = null,Object? completed = null,Object? totalProgress = null,Object? totalScore = null,Object? hasScoring = null,Object? maxScore = freezed,Object? dueDate = null,Object? updatedAt = null,Object? subactivitiesCompleted = null,Object? subactivitiesCompletionRate = null,}) {
  return _then(_ProgressModel(
progressId: null == progressId ? _self.progressId : progressId // ignore: cast_nullable_to_non_nullable
as int,activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,totalProgress: null == totalProgress ? _self.totalProgress : totalProgress // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,hasScoring: null == hasScoring ? _self.hasScoring : hasScoring // ignore: cast_nullable_to_non_nullable
as bool,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,subactivitiesCompleted: null == subactivitiesCompleted ? _self.subactivitiesCompleted : subactivitiesCompleted // ignore: cast_nullable_to_non_nullable
as SubactivitiesCompletedModel,subactivitiesCompletionRate: null == subactivitiesCompletionRate ? _self.subactivitiesCompletionRate : subactivitiesCompletionRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubactivitiesCompletedModelCopyWith<$Res> get subactivitiesCompleted {
  
  return $SubactivitiesCompletedModelCopyWith<$Res>(_self.subactivitiesCompleted, (value) {
    return _then(_self.copyWith(subactivitiesCompleted: value));
  });
}
}


/// @nodoc
mixin _$SubactivitiesCompletedModel {

 bool get reading; bool get paraphrase; bool get mainIdea; bool get summary;
/// Create a copy of SubactivitiesCompletedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubactivitiesCompletedModelCopyWith<SubactivitiesCompletedModel> get copyWith => _$SubactivitiesCompletedModelCopyWithImpl<SubactivitiesCompletedModel>(this as SubactivitiesCompletedModel, _$identity);

  /// Serializes this SubactivitiesCompletedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubactivitiesCompletedModel&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.paraphrase, paraphrase) || other.paraphrase == paraphrase)&&(identical(other.mainIdea, mainIdea) || other.mainIdea == mainIdea)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reading,paraphrase,mainIdea,summary);

@override
String toString() {
  return 'SubactivitiesCompletedModel(reading: $reading, paraphrase: $paraphrase, mainIdea: $mainIdea, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $SubactivitiesCompletedModelCopyWith<$Res>  {
  factory $SubactivitiesCompletedModelCopyWith(SubactivitiesCompletedModel value, $Res Function(SubactivitiesCompletedModel) _then) = _$SubactivitiesCompletedModelCopyWithImpl;
@useResult
$Res call({
 bool reading, bool paraphrase, bool mainIdea, bool summary
});




}
/// @nodoc
class _$SubactivitiesCompletedModelCopyWithImpl<$Res>
    implements $SubactivitiesCompletedModelCopyWith<$Res> {
  _$SubactivitiesCompletedModelCopyWithImpl(this._self, this._then);

  final SubactivitiesCompletedModel _self;
  final $Res Function(SubactivitiesCompletedModel) _then;

/// Create a copy of SubactivitiesCompletedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reading = null,Object? paraphrase = null,Object? mainIdea = null,Object? summary = null,}) {
  return _then(_self.copyWith(
reading: null == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as bool,paraphrase: null == paraphrase ? _self.paraphrase : paraphrase // ignore: cast_nullable_to_non_nullable
as bool,mainIdea: null == mainIdea ? _self.mainIdea : mainIdea // ignore: cast_nullable_to_non_nullable
as bool,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubactivitiesCompletedModel].
extension SubactivitiesCompletedModelPatterns on SubactivitiesCompletedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubactivitiesCompletedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubactivitiesCompletedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubactivitiesCompletedModel value)  $default,){
final _that = this;
switch (_that) {
case _SubactivitiesCompletedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubactivitiesCompletedModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubactivitiesCompletedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool reading,  bool paraphrase,  bool mainIdea,  bool summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubactivitiesCompletedModel() when $default != null:
return $default(_that.reading,_that.paraphrase,_that.mainIdea,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool reading,  bool paraphrase,  bool mainIdea,  bool summary)  $default,) {final _that = this;
switch (_that) {
case _SubactivitiesCompletedModel():
return $default(_that.reading,_that.paraphrase,_that.mainIdea,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool reading,  bool paraphrase,  bool mainIdea,  bool summary)?  $default,) {final _that = this;
switch (_that) {
case _SubactivitiesCompletedModel() when $default != null:
return $default(_that.reading,_that.paraphrase,_that.mainIdea,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubactivitiesCompletedModel implements SubactivitiesCompletedModel {
  const _SubactivitiesCompletedModel({required this.reading, required this.paraphrase, required this.mainIdea, required this.summary});
  factory _SubactivitiesCompletedModel.fromJson(Map<String, dynamic> json) => _$SubactivitiesCompletedModelFromJson(json);

@override final  bool reading;
@override final  bool paraphrase;
@override final  bool mainIdea;
@override final  bool summary;

/// Create a copy of SubactivitiesCompletedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubactivitiesCompletedModelCopyWith<_SubactivitiesCompletedModel> get copyWith => __$SubactivitiesCompletedModelCopyWithImpl<_SubactivitiesCompletedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubactivitiesCompletedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubactivitiesCompletedModel&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.paraphrase, paraphrase) || other.paraphrase == paraphrase)&&(identical(other.mainIdea, mainIdea) || other.mainIdea == mainIdea)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reading,paraphrase,mainIdea,summary);

@override
String toString() {
  return 'SubactivitiesCompletedModel(reading: $reading, paraphrase: $paraphrase, mainIdea: $mainIdea, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$SubactivitiesCompletedModelCopyWith<$Res> implements $SubactivitiesCompletedModelCopyWith<$Res> {
  factory _$SubactivitiesCompletedModelCopyWith(_SubactivitiesCompletedModel value, $Res Function(_SubactivitiesCompletedModel) _then) = __$SubactivitiesCompletedModelCopyWithImpl;
@override @useResult
$Res call({
 bool reading, bool paraphrase, bool mainIdea, bool summary
});




}
/// @nodoc
class __$SubactivitiesCompletedModelCopyWithImpl<$Res>
    implements _$SubactivitiesCompletedModelCopyWith<$Res> {
  __$SubactivitiesCompletedModelCopyWithImpl(this._self, this._then);

  final _SubactivitiesCompletedModel _self;
  final $Res Function(_SubactivitiesCompletedModel) _then;

/// Create a copy of SubactivitiesCompletedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reading = null,Object? paraphrase = null,Object? mainIdea = null,Object? summary = null,}) {
  return _then(_SubactivitiesCompletedModel(
reading: null == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as bool,paraphrase: null == paraphrase ? _self.paraphrase : paraphrase // ignore: cast_nullable_to_non_nullable
as bool,mainIdea: null == mainIdea ? _self.mainIdea : mainIdea // ignore: cast_nullable_to_non_nullable
as bool,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
