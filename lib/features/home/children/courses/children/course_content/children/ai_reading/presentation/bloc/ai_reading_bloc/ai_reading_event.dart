part of 'ai_reading_bloc.dart';

@immutable
sealed class AiReadingEvent extends Equatable {}

final class EvaluateParaphraseEvent extends AiReadingEvent {
  final String paragraph;
  final String paraphrase;
  final int activityId;

  EvaluateParaphraseEvent({
    required this.paragraph,
    required this.paraphrase,
    required this.activityId,
  });
  @override
  List<Object?> get props => [paragraph, paraphrase, activityId];
}

final class EvaluateMainIdeaEvent extends AiReadingEvent {
  final String paragraph;
  final String mainIdea;
  final int activityId;

  EvaluateMainIdeaEvent({
    required this.paragraph,
    required this.mainIdea,
    required this.activityId,
  });
  @override
  List<Object?> get props => [paragraph, mainIdea, activityId];
}

final class EvaluateSummaryEvent extends AiReadingEvent {
  final String paragraph;
  final String summary;
  final int activityId;

  EvaluateSummaryEvent({
    required this.paragraph,
    required this.summary,
    required this.activityId,
  });
  @override
  List<Object?> get props => [paragraph, summary, activityId];
}

final class AiReadingCompletionEvent extends AiReadingEvent {
  final bool completed;

  AiReadingCompletionEvent({required this.completed});
  @override
  List<Object?> get props => [completed];
}

final class AiReadingUpdateParams extends AiReadingEvent {
  final int activityId;
  final String title;
  final String description;
  final DateTime dueDate;

  AiReadingUpdateParams({
    required this.activityId,
    required this.title,
    required this.description,
    required this.dueDate,
  });

  @override
  List<Object?> get props => [activityId, title, description, dueDate];
}

final class AiReadingDeleteActivity extends AiReadingEvent {
  final int activityId;

  AiReadingDeleteActivity({required this.activityId});

  @override
  List<Object?> get props => [activityId];
}
