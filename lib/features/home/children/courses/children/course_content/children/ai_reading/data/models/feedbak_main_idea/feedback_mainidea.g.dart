// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_mainidea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackMainIdea _$FeedbackMainIdeaFromJson(Map<String, dynamic> json) =>
    _FeedbackMainIdea(
      accuracyScore: (json['accuracy_score'] as num).toInt(),
      clarityScore: (json['clarity_score'] as num).toInt(),
      concisenessScore: (json['conciseness_score'] as num).toInt(),
      feedback: json['feedback'] as String,
    );

Map<String, dynamic> _$FeedbackMainIdeaToJson(_FeedbackMainIdea instance) =>
    <String, dynamic>{
      'accuracy_score': instance.accuracyScore,
      'clarity_score': instance.clarityScore,
      'conciseness_score': instance.concisenessScore,
      'feedback': instance.feedback,
    };
