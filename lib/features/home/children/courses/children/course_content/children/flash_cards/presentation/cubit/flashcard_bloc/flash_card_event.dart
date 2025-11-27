part of 'flash_card_bloc.dart';

@immutable
sealed class FlashCardEvent {}

/// Load all flashcards
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

/// Update learning progress
final class FlashCardUpdateProgress extends FlashCardEvent {
  final double progress; // new value (0–1 or 0–100)

  FlashCardUpdateProgress(this.progress);
}
