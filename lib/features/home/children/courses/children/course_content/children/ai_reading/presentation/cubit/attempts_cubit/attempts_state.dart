part of 'attempts_cubit.dart';

@immutable
sealed class AttemptsState {}

final class AttemptsInitial extends AttemptsState {}

final class AttemptsLoading extends AttemptsState {
  final AttemptOperation attemptOperation;

  AttemptsLoading({required this.attemptOperation});
}

final class AttemptsError extends AttemptsState {
  final AttemptOperation attemptOperation;
  final String message;

  AttemptsError({required this.attemptOperation, required this.message});
}

final class AttemptParaphraseCreated extends AttemptsState {
  final ParaphraseAttemptEntity paraphraseAttemptEntity;

  AttemptParaphraseCreated({required this.paraphraseAttemptEntity});
}

final class AttemptMainIdeaCreated extends AttemptsState {
  final MainIdeaAttemptEntity mainIdeaAttemptEntity;

  AttemptMainIdeaCreated({required this.mainIdeaAttemptEntity});
}

final class AttemptSummaryCreated extends AttemptsState {
  final SummaryAttemptEntity summaryAttemptEntity;

  AttemptSummaryCreated({required this.summaryAttemptEntity});
}

final class AttemptReadingCreated extends AttemptsState {
  final ReadingAttemptEntity readingAttemptEntity;

  AttemptReadingCreated({required this.readingAttemptEntity});
}

final class AttemptParaphraseAll extends AttemptsState {
  final List<ParaphraseAttemptEntity> paraphrases;

  AttemptParaphraseAll({required this.paraphrases});
}

final class AttemptMainIdeaAll extends AttemptsState {
  final List<MainIdeaAttemptEntity> mainIdeas;

  AttemptMainIdeaAll({required this.mainIdeas});
}

final class AttemptSummaryAll extends AttemptsState {
  final List<SummaryAttemptEntity> summaries;

  AttemptSummaryAll({required this.summaries});
}

enum AttemptOperation {
  arReading,
  paraphrase,
  mainIdea,
  summary,
  paraphraseAll,
  mainIdeaAll,
  summaryAll,
}
