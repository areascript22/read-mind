part of 'flashcard_creation_cubit.dart';

@immutable
sealed class FlashcardCreationState {}

final class FlashcardCreationInitial extends FlashcardCreationState {}

final class FlashcardCreationLoading extends FlashcardCreationState {}

final class FlashcardCreationError extends FlashcardCreationState {
  final String message;

  FlashcardCreationError({required this.message});
}

final class FlashcardCreationSuccess extends FlashcardCreationState {
  final FlashCardEntity flashCardEntity;

  FlashcardCreationSuccess({required this.flashCardEntity});
}

final class FlashcardCreationUpdated extends FlashcardCreationState {
  final FlashCardEntity flashCardEntity;

  FlashcardCreationUpdated({required this.flashCardEntity});
}

final class FlashcardCreationDeleted extends FlashcardCreationState {
  final String message;

  FlashcardCreationDeleted({required this.message});
}
