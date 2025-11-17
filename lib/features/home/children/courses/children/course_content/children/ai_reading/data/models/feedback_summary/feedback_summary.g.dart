// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackSummary _$FeedbackSummaryFromJson(Map<String, dynamic> json) =>
    _FeedbackSummary(
      accuracyScore: (json['accuracy_score'] as num).toInt(),
      coverageScore: (json['coverage_score'] as num).toInt(),
      clarityScore: (json['clarity_score'] as num).toInt(),
      feedback: json['feedback'] as String,
    );

Map<String, dynamic> _$FeedbackSummaryToJson(_FeedbackSummary instance) =>
    <String, dynamic>{
      'accuracy_score': instance.accuracyScore,
      'coverage_score': instance.coverageScore,
      'clarity_score': instance.clarityScore,
      'feedback': instance.feedback,
    };
