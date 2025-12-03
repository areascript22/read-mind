// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummaryAttemptModel _$SummaryAttemptModelFromJson(Map<String, dynamic> json) =>
    _SummaryAttemptModel(
      id: (json['id'] as num).toInt(),
      aiReadingId: (json['aiReadingId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      accuracyScore: (json['accuracyScore'] as num).toDouble(),
      coverageScore: (json['coverageScore'] as num).toDouble(),
      clarityScore: (json['clarityScore'] as num).toDouble(),
      feedback: json['feedback'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      averageScore: (json['averageScore'] as num).toDouble(),
      timeSpentSec: (json['timeSpentSec'] as num).toInt(),
    );

Map<String, dynamic> _$SummaryAttemptModelToJson(
  _SummaryAttemptModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'aiReadingId': instance.aiReadingId,
  'userId': instance.userId,
  'accuracyScore': instance.accuracyScore,
  'coverageScore': instance.coverageScore,
  'clarityScore': instance.clarityScore,
  'feedback': instance.feedback,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'averageScore': instance.averageScore,
  'timeSpentSec': instance.timeSpentSec,
};
