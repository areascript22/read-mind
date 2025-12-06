part of 'translation_cubit.dart';

@immutable
sealed class TranslationState {}

final class TranslationInitial extends TranslationState {}

final class TranslationLoading extends TranslationState {}

final class TranslationSuccess extends TranslationState {
  final TranslationEntity translation;

  TranslationSuccess(this.translation);
}

final class TranslationFailure extends TranslationState {
  final String message;

  TranslationFailure(this.message);
}
