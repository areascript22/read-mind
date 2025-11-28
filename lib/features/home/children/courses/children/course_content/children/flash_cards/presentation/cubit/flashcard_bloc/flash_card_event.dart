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

final class FlashCardCreateInitialSession extends FlashCardEvent {}
