import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_mainidea_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_summary_entity.dart';
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
    on<EvaluateMainIdeaEvent>(_onEvaluateMainIdea);
    on<EvaluateSummaryEvent>(_onEvaluateSummary);
  }

  void _onEvaluateParaphrase(
    EvaluateParaphraseEvent event,
    Emitter<AiReadingState> emit,
  ) async {
    emit(AiReadingLoading(AiActionType.paraphrase));
    final response = await aiReadingRepository.evaluateParaphrase(
      paragraph: event.paragraph,
      paraphrase: event.paraphrase,
    );
    response.fold(
      (l) => emit(AiReadingError(l.message, AiActionType.paraphrase)),
      (r) => emit(AiReadingSuccess(AiActionType.paraphrase, r)),
    );
  }

  void _onEvaluateMainIdea(
    EvaluateMainIdeaEvent event,
    Emitter<AiReadingState> emit,
  ) async {
    emit(AiReadingLoading(AiActionType.mainIdea));
    final response = await aiReadingRepository.evaluateMainIdea(
      paragraph: event.paragraph,
      mainIdea: event.mainIdea,
    );
    response.fold(
      (l) => emit(AiReadingError(l.message, AiActionType.mainIdea)),
      (r) => emit(MainIdeaSuccess(r)),
    );
  }

  void _onEvaluateSummary(
    EvaluateSummaryEvent event,
    Emitter<AiReadingState> emit,
  ) async {
    emit(AiReadingLoading(AiActionType.summary));
    final response = await aiReadingRepository.evaluateSummary(
      paragraph: event.paragraph,
      summary: event.summary,
    );
    response.fold(
      (l) => emit(AiReadingError(l.message, AiActionType.summary)),
      (r) => emit(SummarySuccess(r)),
    );
  }
}
