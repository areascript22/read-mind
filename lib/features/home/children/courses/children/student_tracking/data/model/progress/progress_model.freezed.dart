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
ProgressModel _$ProgressModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'aiReadingProgress':
          return AiReadingProgress.fromJson(
            json
          );
                case 'flashCardProgress':
          return FlashCardProgress.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ProgressModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ProgressModel {

 int get activityId; String get title; String? get description; bool get completed; int get totalScore; bool get hasScoring; int? get maxScore; String get dueDate;
/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressModelCopyWith<ProgressModel> get copyWith => _$ProgressModelCopyWithImpl<ProgressModel>(this as ProgressModel, _$identity);

  /// Serializes this ProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressModel&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.hasScoring, hasScoring) || other.hasScoring == hasScoring)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activityId,title,description,completed,totalScore,hasScoring,maxScore,dueDate);

@override
String toString() {
  return 'ProgressModel(activityId: $activityId, title: $title, description: $description, completed: $completed, totalScore: $totalScore, hasScoring: $hasScoring, maxScore: $maxScore, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $ProgressModelCopyWith<$Res>  {
  factory $ProgressModelCopyWith(ProgressModel value, $Res Function(ProgressModel) _then) = _$ProgressModelCopyWithImpl;
@useResult
$Res call({
 int activityId, String title, String? description, bool completed, int totalScore, bool hasScoring, int? maxScore, String dueDate
});




}
/// @nodoc
class _$ProgressModelCopyWithImpl<$Res>
    implements $ProgressModelCopyWith<$Res> {
  _$ProgressModelCopyWithImpl(this._self, this._then);

  final ProgressModel _self;
  final $Res Function(ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activityId = null,Object? title = null,Object? description = freezed,Object? completed = null,Object? totalScore = null,Object? hasScoring = null,Object? maxScore = freezed,Object? dueDate = null,}) {
  return _then(_self.copyWith(
activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,hasScoring: null == hasScoring ? _self.hasScoring : hasScoring // ignore: cast_nullable_to_non_nullable
as bool,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AiReadingProgress value)?  aiReadingProgress,TResult Function( FlashCardProgress value)?  flashCardProgress,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AiReadingProgress() when aiReadingProgress != null:
return aiReadingProgress(_that);case FlashCardProgress() when flashCardProgress != null:
return flashCardProgress(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AiReadingProgress value)  aiReadingProgress,required TResult Function( FlashCardProgress value)  flashCardProgress,}){
final _that = this;
switch (_that) {
case AiReadingProgress():
return aiReadingProgress(_that);case FlashCardProgress():
return flashCardProgress(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AiReadingProgress value)?  aiReadingProgress,TResult? Function( FlashCardProgress value)?  flashCardProgress,}){
final _that = this;
switch (_that) {
case AiReadingProgress() when aiReadingProgress != null:
return aiReadingProgress(_that);case FlashCardProgress() when flashCardProgress != null:
return flashCardProgress(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int progressId,  int activityId,  int aiReadingId,  String title,  String? description,  bool completed,  int totalProgress,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String updatedAt,  SubactivitiesCompletedModel subactivitiesCompleted,  int subactivitiesCompletionRate)?  aiReadingProgress,TResult Function( int id,  int activityId,  int flashCardActivityId,  String title,  String? description,  String cardOrder,  int maxCards,  bool completed,  int progressPercentage,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String startedAt,  String completedAt,  StatsModel stats)?  flashCardProgress,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AiReadingProgress() when aiReadingProgress != null:
return aiReadingProgress(_that.progressId,_that.activityId,_that.aiReadingId,_that.title,_that.description,_that.completed,_that.totalProgress,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.updatedAt,_that.subactivitiesCompleted,_that.subactivitiesCompletionRate);case FlashCardProgress() when flashCardProgress != null:
return flashCardProgress(_that.id,_that.activityId,_that.flashCardActivityId,_that.title,_that.description,_that.cardOrder,_that.maxCards,_that.completed,_that.progressPercentage,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.startedAt,_that.completedAt,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int progressId,  int activityId,  int aiReadingId,  String title,  String? description,  bool completed,  int totalProgress,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String updatedAt,  SubactivitiesCompletedModel subactivitiesCompleted,  int subactivitiesCompletionRate)  aiReadingProgress,required TResult Function( int id,  int activityId,  int flashCardActivityId,  String title,  String? description,  String cardOrder,  int maxCards,  bool completed,  int progressPercentage,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String startedAt,  String completedAt,  StatsModel stats)  flashCardProgress,}) {final _that = this;
switch (_that) {
case AiReadingProgress():
return aiReadingProgress(_that.progressId,_that.activityId,_that.aiReadingId,_that.title,_that.description,_that.completed,_that.totalProgress,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.updatedAt,_that.subactivitiesCompleted,_that.subactivitiesCompletionRate);case FlashCardProgress():
return flashCardProgress(_that.id,_that.activityId,_that.flashCardActivityId,_that.title,_that.description,_that.cardOrder,_that.maxCards,_that.completed,_that.progressPercentage,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.startedAt,_that.completedAt,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int progressId,  int activityId,  int aiReadingId,  String title,  String? description,  bool completed,  int totalProgress,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String updatedAt,  SubactivitiesCompletedModel subactivitiesCompleted,  int subactivitiesCompletionRate)?  aiReadingProgress,TResult? Function( int id,  int activityId,  int flashCardActivityId,  String title,  String? description,  String cardOrder,  int maxCards,  bool completed,  int progressPercentage,  int totalScore,  bool hasScoring,  int? maxScore,  String dueDate,  String startedAt,  String completedAt,  StatsModel stats)?  flashCardProgress,}) {final _that = this;
switch (_that) {
case AiReadingProgress() when aiReadingProgress != null:
return aiReadingProgress(_that.progressId,_that.activityId,_that.aiReadingId,_that.title,_that.description,_that.completed,_that.totalProgress,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.updatedAt,_that.subactivitiesCompleted,_that.subactivitiesCompletionRate);case FlashCardProgress() when flashCardProgress != null:
return flashCardProgress(_that.id,_that.activityId,_that.flashCardActivityId,_that.title,_that.description,_that.cardOrder,_that.maxCards,_that.completed,_that.progressPercentage,_that.totalScore,_that.hasScoring,_that.maxScore,_that.dueDate,_that.startedAt,_that.completedAt,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AiReadingProgress implements ProgressModel {
  const AiReadingProgress({required this.progressId, required this.activityId, required this.aiReadingId, required this.title, required this.description, required this.completed, required this.totalProgress, required this.totalScore, required this.hasScoring, required this.maxScore, required this.dueDate, required this.updatedAt, required this.subactivitiesCompleted, required this.subactivitiesCompletionRate, final  String? $type}): $type = $type ?? 'aiReadingProgress';
  factory AiReadingProgress.fromJson(Map<String, dynamic> json) => _$AiReadingProgressFromJson(json);

 final  int progressId;
@override final  int activityId;
 final  int aiReadingId;
@override final  String title;
@override final  String? description;
@override final  bool completed;
 final  int totalProgress;
@override final  int totalScore;
@override final  bool hasScoring;
@override final  int? maxScore;
@override final  String dueDate;
 final  String updatedAt;
 final  SubactivitiesCompletedModel subactivitiesCompleted;
 final  int subactivitiesCompletionRate;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiReadingProgressCopyWith<AiReadingProgress> get copyWith => _$AiReadingProgressCopyWithImpl<AiReadingProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiReadingProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiReadingProgress&&(identical(other.progressId, progressId) || other.progressId == progressId)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.totalProgress, totalProgress) || other.totalProgress == totalProgress)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.hasScoring, hasScoring) || other.hasScoring == hasScoring)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.subactivitiesCompleted, subactivitiesCompleted) || other.subactivitiesCompleted == subactivitiesCompleted)&&(identical(other.subactivitiesCompletionRate, subactivitiesCompletionRate) || other.subactivitiesCompletionRate == subactivitiesCompletionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progressId,activityId,aiReadingId,title,description,completed,totalProgress,totalScore,hasScoring,maxScore,dueDate,updatedAt,subactivitiesCompleted,subactivitiesCompletionRate);

@override
String toString() {
  return 'ProgressModel.aiReadingProgress(progressId: $progressId, activityId: $activityId, aiReadingId: $aiReadingId, title: $title, description: $description, completed: $completed, totalProgress: $totalProgress, totalScore: $totalScore, hasScoring: $hasScoring, maxScore: $maxScore, dueDate: $dueDate, updatedAt: $updatedAt, subactivitiesCompleted: $subactivitiesCompleted, subactivitiesCompletionRate: $subactivitiesCompletionRate)';
}


}

/// @nodoc
abstract mixin class $AiReadingProgressCopyWith<$Res> implements $ProgressModelCopyWith<$Res> {
  factory $AiReadingProgressCopyWith(AiReadingProgress value, $Res Function(AiReadingProgress) _then) = _$AiReadingProgressCopyWithImpl;
@override @useResult
$Res call({
 int progressId, int activityId, int aiReadingId, String title, String? description, bool completed, int totalProgress, int totalScore, bool hasScoring, int? maxScore, String dueDate, String updatedAt, SubactivitiesCompletedModel subactivitiesCompleted, int subactivitiesCompletionRate
});


$SubactivitiesCompletedModelCopyWith<$Res> get subactivitiesCompleted;

}
/// @nodoc
class _$AiReadingProgressCopyWithImpl<$Res>
    implements $AiReadingProgressCopyWith<$Res> {
  _$AiReadingProgressCopyWithImpl(this._self, this._then);

  final AiReadingProgress _self;
  final $Res Function(AiReadingProgress) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progressId = null,Object? activityId = null,Object? aiReadingId = null,Object? title = null,Object? description = freezed,Object? completed = null,Object? totalProgress = null,Object? totalScore = null,Object? hasScoring = null,Object? maxScore = freezed,Object? dueDate = null,Object? updatedAt = null,Object? subactivitiesCompleted = null,Object? subactivitiesCompletionRate = null,}) {
  return _then(AiReadingProgress(
progressId: null == progressId ? _self.progressId : progressId // ignore: cast_nullable_to_non_nullable
as int,activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as int,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()

class FlashCardProgress implements ProgressModel {
  const FlashCardProgress({required this.id, required this.activityId, required this.flashCardActivityId, required this.title, required this.description, required this.cardOrder, required this.maxCards, required this.completed, required this.progressPercentage, required this.totalScore, required this.hasScoring, required this.maxScore, required this.dueDate, required this.startedAt, required this.completedAt, required this.stats, final  String? $type}): $type = $type ?? 'flashCardProgress';
  factory FlashCardProgress.fromJson(Map<String, dynamic> json) => _$FlashCardProgressFromJson(json);

 final  int id;
@override final  int activityId;
 final  int flashCardActivityId;
@override final  String title;
@override final  String? description;
 final  String cardOrder;
 final  int maxCards;
@override final  bool completed;
 final  int progressPercentage;
@override final  int totalScore;
@override final  bool hasScoring;
@override final  int? maxScore;
@override final  String dueDate;
 final  String startedAt;
 final  String completedAt;
 final  StatsModel stats;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashCardProgressCopyWith<FlashCardProgress> get copyWith => _$FlashCardProgressCopyWithImpl<FlashCardProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashCardProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashCardProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.flashCardActivityId, flashCardActivityId) || other.flashCardActivityId == flashCardActivityId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.cardOrder, cardOrder) || other.cardOrder == cardOrder)&&(identical(other.maxCards, maxCards) || other.maxCards == maxCards)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.hasScoring, hasScoring) || other.hasScoring == hasScoring)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,activityId,flashCardActivityId,title,description,cardOrder,maxCards,completed,progressPercentage,totalScore,hasScoring,maxScore,dueDate,startedAt,completedAt,stats);

@override
String toString() {
  return 'ProgressModel.flashCardProgress(id: $id, activityId: $activityId, flashCardActivityId: $flashCardActivityId, title: $title, description: $description, cardOrder: $cardOrder, maxCards: $maxCards, completed: $completed, progressPercentage: $progressPercentage, totalScore: $totalScore, hasScoring: $hasScoring, maxScore: $maxScore, dueDate: $dueDate, startedAt: $startedAt, completedAt: $completedAt, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $FlashCardProgressCopyWith<$Res> implements $ProgressModelCopyWith<$Res> {
  factory $FlashCardProgressCopyWith(FlashCardProgress value, $Res Function(FlashCardProgress) _then) = _$FlashCardProgressCopyWithImpl;
@override @useResult
$Res call({
 int id, int activityId, int flashCardActivityId, String title, String? description, String cardOrder, int maxCards, bool completed, int progressPercentage, int totalScore, bool hasScoring, int? maxScore, String dueDate, String startedAt, String completedAt, StatsModel stats
});


$StatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class _$FlashCardProgressCopyWithImpl<$Res>
    implements $FlashCardProgressCopyWith<$Res> {
  _$FlashCardProgressCopyWithImpl(this._self, this._then);

  final FlashCardProgress _self;
  final $Res Function(FlashCardProgress) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? activityId = null,Object? flashCardActivityId = null,Object? title = null,Object? description = freezed,Object? cardOrder = null,Object? maxCards = null,Object? completed = null,Object? progressPercentage = null,Object? totalScore = null,Object? hasScoring = null,Object? maxScore = freezed,Object? dueDate = null,Object? startedAt = null,Object? completedAt = null,Object? stats = null,}) {
  return _then(FlashCardProgress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as int,flashCardActivityId: null == flashCardActivityId ? _self.flashCardActivityId : flashCardActivityId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cardOrder: null == cardOrder ? _self.cardOrder : cardOrder // ignore: cast_nullable_to_non_nullable
as String,maxCards: null == maxCards ? _self.maxCards : maxCards // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,hasScoring: null == hasScoring ? _self.hasScoring : hasScoring // ignore: cast_nullable_to_non_nullable
as bool,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as StatsModel,
  ));
}

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatsModelCopyWith<$Res> get stats {
  
  return $StatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
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


/// @nodoc
mixin _$StatsModel {

 int get totalAttempts; int get correctAnswers; int get incorrectAnswers; int get totalTimeSec; int get avgTimePerCard; int get confidenceScore;
/// Create a copy of StatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsModelCopyWith<StatsModel> get copyWith => _$StatsModelCopyWithImpl<StatsModel>(this as StatsModel, _$identity);

  /// Serializes this StatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsModel&&(identical(other.totalAttempts, totalAttempts) || other.totalAttempts == totalAttempts)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.totalTimeSec, totalTimeSec) || other.totalTimeSec == totalTimeSec)&&(identical(other.avgTimePerCard, avgTimePerCard) || other.avgTimePerCard == avgTimePerCard)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAttempts,correctAnswers,incorrectAnswers,totalTimeSec,avgTimePerCard,confidenceScore);

@override
String toString() {
  return 'StatsModel(totalAttempts: $totalAttempts, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, totalTimeSec: $totalTimeSec, avgTimePerCard: $avgTimePerCard, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class $StatsModelCopyWith<$Res>  {
  factory $StatsModelCopyWith(StatsModel value, $Res Function(StatsModel) _then) = _$StatsModelCopyWithImpl;
@useResult
$Res call({
 int totalAttempts, int correctAnswers, int incorrectAnswers, int totalTimeSec, int avgTimePerCard, int confidenceScore
});




}
/// @nodoc
class _$StatsModelCopyWithImpl<$Res>
    implements $StatsModelCopyWith<$Res> {
  _$StatsModelCopyWithImpl(this._self, this._then);

  final StatsModel _self;
  final $Res Function(StatsModel) _then;

/// Create a copy of StatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAttempts = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? totalTimeSec = null,Object? avgTimePerCard = null,Object? confidenceScore = null,}) {
  return _then(_self.copyWith(
totalAttempts: null == totalAttempts ? _self.totalAttempts : totalAttempts // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,totalTimeSec: null == totalTimeSec ? _self.totalTimeSec : totalTimeSec // ignore: cast_nullable_to_non_nullable
as int,avgTimePerCard: null == avgTimePerCard ? _self.avgTimePerCard : avgTimePerCard // ignore: cast_nullable_to_non_nullable
as int,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsModel].
extension StatsModelPatterns on StatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsModel value)  $default,){
final _that = this;
switch (_that) {
case _StatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalAttempts,  int correctAnswers,  int incorrectAnswers,  int totalTimeSec,  int avgTimePerCard,  int confidenceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsModel() when $default != null:
return $default(_that.totalAttempts,_that.correctAnswers,_that.incorrectAnswers,_that.totalTimeSec,_that.avgTimePerCard,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalAttempts,  int correctAnswers,  int incorrectAnswers,  int totalTimeSec,  int avgTimePerCard,  int confidenceScore)  $default,) {final _that = this;
switch (_that) {
case _StatsModel():
return $default(_that.totalAttempts,_that.correctAnswers,_that.incorrectAnswers,_that.totalTimeSec,_that.avgTimePerCard,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalAttempts,  int correctAnswers,  int incorrectAnswers,  int totalTimeSec,  int avgTimePerCard,  int confidenceScore)?  $default,) {final _that = this;
switch (_that) {
case _StatsModel() when $default != null:
return $default(_that.totalAttempts,_that.correctAnswers,_that.incorrectAnswers,_that.totalTimeSec,_that.avgTimePerCard,_that.confidenceScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatsModel implements StatsModel {
  const _StatsModel({required this.totalAttempts, required this.correctAnswers, required this.incorrectAnswers, required this.totalTimeSec, required this.avgTimePerCard, required this.confidenceScore});
  factory _StatsModel.fromJson(Map<String, dynamic> json) => _$StatsModelFromJson(json);

@override final  int totalAttempts;
@override final  int correctAnswers;
@override final  int incorrectAnswers;
@override final  int totalTimeSec;
@override final  int avgTimePerCard;
@override final  int confidenceScore;

/// Create a copy of StatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsModelCopyWith<_StatsModel> get copyWith => __$StatsModelCopyWithImpl<_StatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsModel&&(identical(other.totalAttempts, totalAttempts) || other.totalAttempts == totalAttempts)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.totalTimeSec, totalTimeSec) || other.totalTimeSec == totalTimeSec)&&(identical(other.avgTimePerCard, avgTimePerCard) || other.avgTimePerCard == avgTimePerCard)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAttempts,correctAnswers,incorrectAnswers,totalTimeSec,avgTimePerCard,confidenceScore);

@override
String toString() {
  return 'StatsModel(totalAttempts: $totalAttempts, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, totalTimeSec: $totalTimeSec, avgTimePerCard: $avgTimePerCard, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class _$StatsModelCopyWith<$Res> implements $StatsModelCopyWith<$Res> {
  factory _$StatsModelCopyWith(_StatsModel value, $Res Function(_StatsModel) _then) = __$StatsModelCopyWithImpl;
@override @useResult
$Res call({
 int totalAttempts, int correctAnswers, int incorrectAnswers, int totalTimeSec, int avgTimePerCard, int confidenceScore
});




}
/// @nodoc
class __$StatsModelCopyWithImpl<$Res>
    implements _$StatsModelCopyWith<$Res> {
  __$StatsModelCopyWithImpl(this._self, this._then);

  final _StatsModel _self;
  final $Res Function(_StatsModel) _then;

/// Create a copy of StatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAttempts = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? totalTimeSec = null,Object? avgTimePerCard = null,Object? confidenceScore = null,}) {
  return _then(_StatsModel(
totalAttempts: null == totalAttempts ? _self.totalAttempts : totalAttempts // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,totalTimeSec: null == totalTimeSec ? _self.totalTimeSec : totalTimeSec // ignore: cast_nullable_to_non_nullable
as int,avgTimePerCard: null == avgTimePerCard ? _self.avgTimePerCard : avgTimePerCard // ignore: cast_nullable_to_non_nullable
as int,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
