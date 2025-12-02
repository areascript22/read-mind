import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/flash_card_session_entity.dart';
part 'flash_card_session.freezed.dart';
part 'flash_card_session.g.dart';

@freezed
abstract class FlashCardSession with _$FlashCardSession {
  const factory FlashCardSession({
    required int id,
    required int flashCardActivityId,
    required int studentId,
    required DateTime startedAt,
    required DateTime? completedAt,
    required int totalTimeSec,
    required int cardsCompleted,
    required int correctAnswers,
    required int incorrectAnswers,
    required int score,
  }) = _FlashCardSession;

  factory FlashCardSession.fromJson(Map<String, dynamic> json) =>
      _$FlashCardSessionFromJson(json);
}

extension FlashCardSessionX on FlashCardSession {
  FlashCardSessionEntity toEntity() {
    return FlashCardSessionEntity(
      id: id,
      flashCardActivityId: flashCardActivityId,
      studentId: studentId,
      startedAt: startedAt,
      completedAt: completedAt,
      totalTimeSec: totalTimeSec,
      cardsCompleted: cardsCompleted,
      correctAnswers: correctAnswers,
      incorrectAnswers: incorrectAnswers,
      score: score,
    );
  }
}
