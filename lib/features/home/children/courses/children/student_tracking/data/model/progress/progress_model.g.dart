// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressModel _$ProgressModelFromJson(Map<String, dynamic> json) =>
    _ProgressModel(
      progressId: (json['progressId'] as num).toInt(),
      activityId: (json['activityId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      courseName: json['courseName'] as String,
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
    );

Map<String, dynamic> _$ProgressModelToJson(_ProgressModel instance) =>
    <String, dynamic>{
      'progressId': instance.progressId,
      'activityId': instance.activityId,
      'title': instance.title,
      'description': instance.description,
      'courseName': instance.courseName,
      'completed': instance.completed,
      'totalProgress': instance.totalProgress,
      'totalScore': instance.totalScore,
      'hasScoring': instance.hasScoring,
      'maxScore': instance.maxScore,
      'dueDate': instance.dueDate,
      'updatedAt': instance.updatedAt,
      'subactivitiesCompleted': instance.subactivitiesCompleted,
      'subactivitiesCompletionRate': instance.subactivitiesCompletionRate,
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
