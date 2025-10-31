part of 'vocabulary_bloc.dart';

@immutable
sealed class VocabularyEvent {}

final class LoadAllTranslations extends VocabularyEvent {}
