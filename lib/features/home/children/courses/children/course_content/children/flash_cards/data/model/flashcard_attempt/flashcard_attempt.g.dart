// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlashcardAttempt _$FlashcardAttemptFromJson(Map<String, dynamic> json) =>
    _FlashcardAttempt(
      id: (json['id'] as num).toInt(),
      sessionId: (json['sessionId'] as num).toInt(),
      userTranslationId: (json['userTranslationId'] as num).toInt(),
      userAnswer: json['userAnswer'] as String,
      isCorrect: json['isCorrect'] as bool,
      timeSpentSec: (json['timeSpentSec'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FlashcardAttemptToJson(_FlashcardAttempt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'userTranslationId': instance.userTranslationId,
      'userAnswer': instance.userAnswer,
      'isCorrect': instance.isCorrect,
      'timeSpentSec': instance.timeSpentSec,
      'createdAt': instance.createdAt.toIso8601String(),
    };
