part of 'vocabulary_bloc.dart';

@immutable
sealed class VocabularyState {}

final class VocabularyInitial extends VocabularyState {}

final class VocabularyLoading extends VocabularyState {}

final class VocabularyLoaded extends VocabularyState {
  final List<TranslationEntity> translations;

  VocabularyLoaded(this.translations);
}

final class VocabularyError extends VocabularyState {
  final String message;

  VocabularyError(this.message);
}

final class VocabularyEmpty extends VocabularyState {}
