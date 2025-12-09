part of 'ai_reading_bloc.dart';

enum AiActionType {
  paraphrase,
  mainIdea,
  summary,
  aiReading,
  aiReadingUpdateParams,
}

@immutable
sealed class AiReadingState extends Equatable {}

final class AiReadingInitial extends AiReadingState {
  @override
  List<Object?> get props => [];
}

final class AiReadingLoading extends AiReadingState {
  final AiActionType actionType;
  AiReadingLoading(this.actionType);
  @override
  List<Object?> get props => [actionType];
}

final class AiReadingError extends AiReadingState {
  final String message;
  final AiActionType actionType;

  AiReadingError(this.message, this.actionType);

  @override
  List<Object?> get props => [message, actionType];
}

final class AiReadingSuccess extends AiReadingState {
  final AiActionType actionType;
  final FeedbackEntity feedbackEntity;

  AiReadingSuccess(this.actionType, this.feedbackEntity);

  @override
  List<Object?> get props => [actionType, feedbackEntity];
}

final class MainIdeaSuccess extends AiReadingState {
  final FeedbackMainIdeaEntity feedbackEntity;

  MainIdeaSuccess(this.feedbackEntity);

  @override
  List<Object?> get props => [feedbackEntity];
}

final class SummarySuccess extends AiReadingState {
  final FeedbackSummaryEntity feedbackEntity;

  SummarySuccess(this.feedbackEntity);

  @override
  List<Object?> get props => [feedbackEntity];
}

final class AiReadingParamsUpdated extends AiReadingState {
  final AIReadingEntity aiReadingUpdated;
  AiReadingParamsUpdated({required this.aiReadingUpdated});

  @override
  List<Object?> get props => [aiReadingUpdated];
}
