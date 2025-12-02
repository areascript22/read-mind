// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiReadingProgress _$AiReadingProgressFromJson(Map<String, dynamic> json) =>
    AiReadingProgress(
      progressId: (json['progressId'] as num).toInt(),
      activityId: (json['activityId'] as num).toInt(),
      aiReadingId: (json['aiReadingId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      completed: json['completed'] as bool,
      totalProgress: (json['totalProgress'] as num).toInt(),
      totalScore: (json['totalScore'] as num).toInt(),
      hasScoring: json['hasScoring'] as bool,
      maxScore: (json['maxScore'] as num?)?.toInt(),
      dueDate: json['dueDate'] as String,
      updatedAt: json['updatedAt'] as String,
      subactivitiesCompleted: SubactivitiesCompletedModel.fromJson(
        json['subactivitiesCompleted'] as Map<String, dynamic>,
      ),
      subactivitiesCompletionRate:
          (json['subactivitiesCompletionRate'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$AiReadingProgressToJson(AiReadingProgress instance) =>
    <String, dynamic>{
      'progressId': instance.progressId,
      'activityId': instance.activityId,
      'aiReadingId': instance.aiReadingId,
      'title': instance.title,
      'description': instance.description,
      'completed': instance.completed,
      'totalProgress': instance.totalProgress,
      'totalScore': instance.totalScore,
      'hasScoring': instance.hasScoring,
      'maxScore': instance.maxScore,
      'dueDate': instance.dueDate,
      'updatedAt': instance.updatedAt,
      'subactivitiesCompleted': instance.subactivitiesCompleted,
      'subactivitiesCompletionRate': instance.subactivitiesCompletionRate,
      'type': instance.$type,
    };

FlashCardProgress _$FlashCardProgressFromJson(Map<String, dynamic> json) =>
    FlashCardProgress(
      id: (json['id'] as num).toInt(),
      activityId: (json['activityId'] as num).toInt(),
      flashCardActivityId: (json['flashCardActivityId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      cardOrder: json['cardOrder'] as String,
      maxCards: (json['maxCards'] as num).toInt(),
      completed: json['completed'] as bool,
      progressPercentage: (json['progressPercentage'] as num).toInt(),
      totalScore: (json['totalScore'] as num).toInt(),
      hasScoring: json['hasScoring'] as bool,
      maxScore: (json['maxScore'] as num?)?.toInt(),
      dueDate: json['dueDate'] as String,
      startedAt: json['startedAt'] as String,
      completedAt: json['completedAt'] as String,
      stats: StatsModel.fromJson(json['stats'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$FlashCardProgressToJson(FlashCardProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityId': instance.activityId,
      'flashCardActivityId': instance.flashCardActivityId,
      'title': instance.title,
      'description': instance.description,
      'cardOrder': instance.cardOrder,
      'maxCards': instance.maxCards,
      'completed': instance.completed,
      'progressPercentage': instance.progressPercentage,
      'totalScore': instance.totalScore,
      'hasScoring': instance.hasScoring,
      'maxScore': instance.maxScore,
      'dueDate': instance.dueDate,
      'startedAt': instance.startedAt,
      'completedAt': instance.completedAt,
      'stats': instance.stats,
      'type': instance.$type,
    };

_SubactivitiesCompletedModel _$SubactivitiesCompletedModelFromJson(
  Map<String, dynamic> json,
) => _SubactivitiesCompletedModel(
  reading: json['reading'] as bool,
  paraphrase: json['paraphrase'] as bool,
  mainIdea: json['mainIdea'] as bool,
  summary: json['summary'] as bool,
);

Map<String, dynamic> _$SubactivitiesCompletedModelToJson(
  _SubactivitiesCompletedModel instance,
) => <String, dynamic>{
  'reading': instance.reading,
  'paraphrase': instance.paraphrase,
  'mainIdea': instance.mainIdea,
  'summary': instance.summary,
};

_StatsModel _$StatsModelFromJson(Map<String, dynamic> json) => _StatsModel(
  totalAttempts: (json['totalAttempts'] as num).toInt(),
  correctAnswers: (json['correctAnswers'] as num).toInt(),
  incorrectAnswers: (json['incorrectAnswers'] as num).toInt(),
  totalTimeSec: (json['totalTimeSec'] as num).toInt(),
  avgTimePerCard: (json['avgTimePerCard'] as num).toInt(),
  confidenceScore: (json['confidenceScore'] as num).toInt(),
);

Map<String, dynamic> _$StatsModelToJson(_StatsModel instance) =>
    <String, dynamic>{
      'totalAttempts': instance.totalAttempts,
      'correctAnswers': instance.correctAnswers,
      'incorrectAnswers': instance.incorrectAnswers,
      'totalTimeSec': instance.totalTimeSec,
      'avgTimePerCard': instance.avgTimePerCard,
      'confidenceScore': instance.confidenceScore,
    };
