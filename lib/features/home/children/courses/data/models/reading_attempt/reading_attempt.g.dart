// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadingAttempt _$ReadingAttemptFromJson(Map<String, dynamic> json) =>
    _ReadingAttempt(
      id: (json['id'] as num).toInt(),
      aiReadingId: (json['aiReadingId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      timeSpentSec: (json['timeSpentSec'] as num).toInt(),
      playCount: (json['playCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ReadingAttemptToJson(_ReadingAttempt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aiReadingId': instance.aiReadingId,
      'userId': instance.userId,
      'timeSpentSec': instance.timeSpentSec,
      'playCount': instance.playCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
