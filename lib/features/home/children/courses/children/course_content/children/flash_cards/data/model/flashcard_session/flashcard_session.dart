import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/flashcard_session_entity.dart';

part 'flashcard_session.freezed.dart';
part 'flashcard_session.g.dart';

@freezed
abstract class FlashcardSession with _$FlashcardSession {
  const factory FlashcardSession({
    required int id,
    required int flashCardActivityId,
    required int studentId,
    required DateTime startedAt,
    DateTime? completedAt,
    required int totalTimeSec,
    required int cardsCompleted,
    required int correctAnswers,
    required int incorrectAnswers,
    double? confidenceScore,
  }) = _FlashcardSession;

  factory FlashcardSession.fromJson(Map<String, dynamic> json) =>
      _$FlashcardSessionFromJson(json);
}

extension FlashcardSessionMapper on FlashcardSession {
  FlashcardSessionEntity toEntity() {
    return FlashcardSessionEntity(
      id: id,
      flashCardActivityId: flashCardActivityId,
      studentId: studentId,
      startedAt: startedAt,
      completedAt: completedAt,
      totalTimeSec: totalTimeSec,
      cardsCompleted: cardsCompleted,
      correctAnswers: correctAnswers,
      incorrectAnswers: incorrectAnswers,
      confidenceScore: confidenceScore,
    );
  }
}
