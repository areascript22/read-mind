part of 'ai_reading_bloc.dart';

@immutable
sealed class AiReadingEvent extends Equatable {}

final class EvaluateParaphraseEvent extends AiReadingEvent {
  final String paragraph;
  final String paraphrase;

  EvaluateParaphraseEvent({required this.paragraph, required this.paraphrase});
  @override
  List<Object?> get props => [];
}
