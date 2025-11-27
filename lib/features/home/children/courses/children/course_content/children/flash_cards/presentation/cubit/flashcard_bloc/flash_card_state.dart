part of 'flash_card_bloc.dart';

@immutable
class FlashCardState {
  final bool isGettingAllCards;
  final List<TranslationEntity> cards;
  final bool isCardsLoaded;
  final double progress; // 0–1.0 or percentage
  final String? errorMessage;
  final int? currentFlashCardActivity;

  const FlashCardState({
    this.isGettingAllCards = false,
    this.isCardsLoaded = false,
    this.cards = const [],
    this.progress = 0.0,
    this.errorMessage,
    this.currentFlashCardActivity,
  });

  FlashCardState copyWith({
    bool? isGettingAllCards,
    bool? isCardsLoaded,
    List<TranslationEntity>? cards,
    double? progress,
    String? errorMessage,
    int? currentFlashCardActivity,
  }) {
    return FlashCardState(
      isGettingAllCards: isGettingAllCards ?? this.isGettingAllCards,
      isCardsLoaded: isCardsLoaded ?? this.isCardsLoaded,
      cards: cards ?? this.cards,
      progress: progress ?? this.progress,
      errorMessage: errorMessage,
      currentFlashCardActivity:
          currentFlashCardActivity ?? this.currentFlashCardActivity,
    );
  }
}
