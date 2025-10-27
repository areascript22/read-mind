import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'ai_reading_event.dart';
part 'ai_reading_state.dart';

class AiReadingBloc extends Bloc<AiReadingEvent, AiReadingState> {
  final AiReadingRepository aiReadingRepository;
  AiReadingBloc({required this.aiReadingRepository})
    : super(AiReadingInitial()) {
    on<EvaluateParaphraseEvent>(_onEvaluateParaphrase);
  }

  void _onEvaluateParaphrase(
    EvaluateParaphraseEvent event,
    Emitter<AiReadingState> state,
  ) async {
    final response = await aiReadingRepository.evaluateParaphrase(
      paragraph: event.paragraph,
      paraphrase: event.paraphrase,
    );
  }
}
