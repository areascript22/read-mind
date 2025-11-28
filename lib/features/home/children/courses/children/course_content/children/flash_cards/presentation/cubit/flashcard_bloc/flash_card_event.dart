part of 'flash_card_bloc.dart';

@immutable
sealed class FlashCardEvent {}

final class FlashCardLoadAll extends FlashCardEvent {
  final int limit;
  final String order;
  final int currentFlashCardActivity;

  FlashCardLoadAll({
    required this.limit,
    required this.order,
    required this.currentFlashCardActivity,
  });
}

final class FlashCardCreateInitialSession extends FlashCardEvent {
  final int activityId;

  FlashCardCreateInitialSession({required this.activityId});
}

final class FlashCardCompleteSession extends FlashCardEvent {
  final int sessionId;

  FlashCardCompleteSession({required this.sessionId});
}

final class FlashCardCreateAttempt extends FlashCardEvent {
  final int sessionId;
  final int userTranslationId;
  final String userAnswer;
  final int timeSpentSec;
  final bool isCorrect;
  FlashCardCreateAttempt({
    required this.sessionId,
    required this.userTranslationId,
    required this.userAnswer,
    required this.timeSpentSec,
    required this.isCorrect,
  });
}
