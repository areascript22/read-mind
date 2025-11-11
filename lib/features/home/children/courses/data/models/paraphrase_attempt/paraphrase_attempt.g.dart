// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paraphrase_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParaphraseAttemptModel _$ParaphraseAttemptModelFromJson(
  Map<String, dynamic> json,
) => _ParaphraseAttemptModel(
  id: (json['id'] as num).toInt(),
  aiReadingId: (json['aiReadingId'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  similarityScore: (json['similarityScore'] as num).toDouble(),
  fluencyScore: (json['fluencyScore'] as num).toDouble(),
  originalityScore: (json['originalityScore'] as num).toDouble(),
  feedback: json['feedback'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ParaphraseAttemptModelToJson(
  _ParaphraseAttemptModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'aiReadingId': instance.aiReadingId,
  'userId': instance.userId,
  'similarityScore': instance.similarityScore,
  'fluencyScore': instance.fluencyScore,
  'originalityScore': instance.originalityScore,
  'feedback': instance.feedback,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
