part of 'flash_card_bloc.dart';

@immutable
class FlashCardState {
  final FlashCardAction flashCardAction;
  final bool isGettingAllCards;
  final bool isCreatingInitialSession;
  final bool isCompletingSession;
  final bool isSavingCardAttempt;

  final FlashcardSessionEntity currentFlashcardSession;
  final List<TranslationEntity> cards;
  final FlashcardAttemptEntity currentFlashcardAttempt;

  final bool isCardsLoaded;

  final int currentFlashCardActivity;

  final String errorMessage;
  final String errorInitialSession;
  final String errorCompleteSession;
  final String errorSaveCardAttempt;

  const FlashCardState({
    this.isGettingAllCards = false,
    this.isCardsLoaded = false,
    this.isCreatingInitialSession = false,
    this.cards = const [],
    this.currentFlashCardActivity = 0,
    this.errorMessage = '',
    this.errorInitialSession = '',
    this.errorCompleteSession = '',
    this.errorSaveCardAttempt = '',
    required this.currentFlashcardSession,
    this.isCompletingSession = false,
    this.isSavingCardAttempt = false,
    required this.currentFlashcardAttempt,
    this.flashCardAction = FlashCardAction.none,
  });

  FlashCardState copyWith({
    bool? isGettingAllCards,
    bool? isCardsLoaded,
    bool? isCreatingInitialSession,
    List<TranslationEntity>? cards,
    String? errorMessage,
    int? currentFlashCardActivity,
    String? errorInitialSession,
    String? errorCompleteSession,
    String? errorSaveCardAttempt,
    FlashcardSessionEntity? currentFlashcardSession,
    bool? isCompletingSession,
    bool? isSavingCardAttempt,
    FlashcardAttemptEntity? currentFlashcardAttempt,
    FlashCardAction? flashCardAction,
  }) {
    return FlashCardState(
      isGettingAllCards: isGettingAllCards ?? this.isGettingAllCards,
      isCardsLoaded: isCardsLoaded ?? this.isCardsLoaded,
      isCreatingInitialSession:
          isCreatingInitialSession ?? this.isCreatingInitialSession,
      cards: cards ?? this.cards,
      errorMessage: errorMessage ?? this.errorMessage,
      currentFlashCardActivity:
          currentFlashCardActivity ?? this.currentFlashCardActivity,
      errorInitialSession: errorInitialSession ?? this.errorInitialSession,
      errorCompleteSession: errorCompleteSession ?? this.errorCompleteSession,
      currentFlashcardSession:
          currentFlashcardSession ?? this.currentFlashcardSession,
      isCompletingSession: isCompletingSession ?? this.isCompletingSession,
      isSavingCardAttempt: isSavingCardAttempt ?? this.isSavingCardAttempt,
      errorSaveCardAttempt: errorSaveCardAttempt ?? this.errorSaveCardAttempt,
      currentFlashcardAttempt:
          currentFlashcardAttempt ?? this.currentFlashcardAttempt,
      flashCardAction: flashCardAction ?? this.flashCardAction,
    );
  }
}

enum FlashCardAction {
  none,
  loadAll,
  initSession,
  completeSession,
  createAttempt,
}
