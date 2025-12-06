import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/flashcard_attempt.dart';

part 'flashcard_attempt.freezed.dart';
part 'flashcard_attempt.g.dart';

@freezed
abstract class FlashcardAttempt with _$FlashcardAttempt {
  const factory FlashcardAttempt({
    required int id,
    required int sessionId,
    required int userTranslationId,
    required String userAnswer,
    required bool isCorrect,
    required int timeSpentSec,
    required DateTime createdAt,
  }) = _FlashcardAttempt;

  factory FlashcardAttempt.fromJson(Map<String, dynamic> json) =>
      _$FlashcardAttemptFromJson(json);
}

extension FlashcardAttemptMapper on FlashcardAttempt {
  FlashcardAttemptEntity toEntity() {
    return FlashcardAttemptEntity(
      id: id,
      sessionId: sessionId,
      userTranslationId: userTranslationId,
      userAnswer: userAnswer,
      isCorrect: isCorrect,
      timeSpentSec: timeSpentSec,
      createdAt: createdAt,
    );
  }
}
