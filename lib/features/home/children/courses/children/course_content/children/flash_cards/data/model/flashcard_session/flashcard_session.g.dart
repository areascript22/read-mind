// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlashcardSession _$FlashcardSessionFromJson(Map<String, dynamic> json) =>
    _FlashcardSession(
      id: (json['id'] as num).toInt(),
      flashCardActivityId: (json['flashCardActivityId'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt:
          json['completedAt'] == null
              ? null
              : DateTime.parse(json['completedAt'] as String),
      totalTimeSec: (json['totalTimeSec'] as num).toInt(),
      cardsCompleted: (json['cardsCompleted'] as num).toInt(),
      correctAnswers: (json['correctAnswers'] as num).toInt(),
      incorrectAnswers: (json['incorrectAnswers'] as num).toInt(),
      confidenceScore: (json['confidenceScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlashcardSessionToJson(_FlashcardSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flashCardActivityId': instance.flashCardActivityId,
      'studentId': instance.studentId,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'totalTimeSec': instance.totalTimeSec,
      'cardsCompleted': instance.cardsCompleted,
      'correctAnswers': instance.correctAnswers,
      'incorrectAnswers': instance.incorrectAnswers,
      'confidenceScore': instance.confidenceScore,
    };
