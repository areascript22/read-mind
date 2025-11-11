// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) =>
    _StatisticsModel(
      total: (json['total'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      inProgress: (json['inProgress'] as num).toInt(),
      notStarted: (json['notStarted'] as num).toInt(),
      averageScore: (json['averageScore'] as num).toDouble(),
      totalActivitiesWithScoring:
          (json['totalActivitiesWithScoring'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toInt(),
    );

Map<String, dynamic> _$StatisticsModelToJson(_StatisticsModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'completed': instance.completed,
      'inProgress': instance.inProgress,
      'notStarted': instance.notStarted,
      'averageScore': instance.averageScore,
      'totalActivitiesWithScoring': instance.totalActivitiesWithScoring,
      'completionRate': instance.completionRate,
    };
