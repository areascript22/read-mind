part of 'ai_reading_bloc.dart';

@immutable
sealed class AiReadingEvent extends Equatable {}

final class EvaluateParaphraseEvent extends AiReadingEvent {
  final String paragraph;
  final String paraphrase;

  EvaluateParaphraseEvent({required this.paragraph, required this.paraphrase});
  @override
  List<Object?> get props => [paragraph, paraphrase];
}

final class EvaluateMainIdeaEvent extends AiReadingEvent {
  final String paragraph;
  final String mainIdea;

  EvaluateMainIdeaEvent({required this.paragraph, required this.mainIdea});
  @override
  List<Object?> get props => [paragraph, mainIdea];
}

final class EvaluateSummaryEvent extends AiReadingEvent {
  final String paragraph;
  final String summary;

  EvaluateSummaryEvent({required this.paragraph, required this.summary});
  @override
  List<Object?> get props => [paragraph, summary];
}
