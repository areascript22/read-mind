part of 'tracking_bloc.dart';

@immutable
sealed class TrackingState {}

final class TrackingInitial extends TrackingState {}

final class TrackingLoading extends TrackingState {
  final TrackingOperation operation;

  TrackingLoading({required this.operation});
}

final class TrackingError extends TrackingState {
  final TrackingOperation operation;
  final String message;

  TrackingError({required this.operation, required this.message});
}

final class TrackingLoaded extends TrackingState {
  final TrackingEntity trackingData;

  TrackingLoaded({required this.trackingData});
}

final class TrackingAllParaphrasesLoaded extends TrackingState {
  final List<ParaphraseAttemptEntity> paraphrases;

  TrackingAllParaphrasesLoaded({required this.paraphrases});
}

final class TrackingAllMainIdeasLoaded extends TrackingState {
  final List<MainIdeaAttemptEntity> mainIdeas;

  TrackingAllMainIdeasLoaded({required this.mainIdeas});
}

final class TrackingAllSummariesLoaded extends TrackingState {
  final List<SummaryAttemptEntity> summaries;

  TrackingAllSummariesLoaded({required this.summaries});
}

enum TrackingOperation {
  load,
  create,
  update,
  allParaphrases,
  allMainIdeas,
  allSummaries,
}
