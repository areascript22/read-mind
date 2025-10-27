// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    _FeedbackModel(
      similarityScore: (json['similarity_score'] as num).toInt(),
      fluencyScore: (json['fluency_score'] as num).toInt(),
      originalityScore: (json['originality_score'] as num).toInt(),
      feedback: json['feedback'] as String,
    );

Map<String, dynamic> _$FeedbackModelToJson(_FeedbackModel instance) =>
    <String, dynamic>{
      'similarity_score': instance.similarityScore,
      'fluency_score': instance.fluencyScore,
      'originality_score': instance.originalityScore,
      'feedback': instance.feedback,
    };
