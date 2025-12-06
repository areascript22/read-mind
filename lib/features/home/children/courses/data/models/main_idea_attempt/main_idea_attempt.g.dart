// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_idea_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MainIdeaAttemptModel _$MainIdeaAttemptModelFromJson(
  Map<String, dynamic> json,
) => _MainIdeaAttemptModel(
  id: (json['id'] as num).toInt(),
  aiReadingId: (json['aiReadingId'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  accuracyScore: (json['accuracyScore'] as num).toDouble(),
  clarityScore: (json['clarityScore'] as num).toDouble(),
  concisenessScore: (json['concisenessScore'] as num).toDouble(),
  feedback: json['feedback'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  averageScore: (json['averageScore'] as num).toDouble(),
  timeSpentSec: (json['timeSpentSec'] as num).toInt(),
);

Map<String, dynamic> _$MainIdeaAttemptModelToJson(
  _MainIdeaAttemptModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'aiReadingId': instance.aiReadingId,
  'userId': instance.userId,
  'accuracyScore': instance.accuracyScore,
  'clarityScore': instance.clarityScore,
  'concisenessScore': instance.concisenessScore,
  'feedback': instance.feedback,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'averageScore': instance.averageScore,
  'timeSpentSec': instance.timeSpentSec,
};
