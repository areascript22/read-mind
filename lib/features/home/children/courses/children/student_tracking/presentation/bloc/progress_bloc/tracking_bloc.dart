import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/domain/entities/main_idea_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/paraphrase_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/summary_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/attempts_repository.dart';
import 'package:flutter/material.dart';
import '../../../../../domain/entities/flash_card_session_entity.dart';
import '../../../domian/entity/tracking_entity.dart';
import '../../../domian/repository/progress_repository.dart';
part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final ProgressRepository progressRepository;
  final AttemptsRepository attemptsRepository;

  TrackingBloc({
    required this.progressRepository,
    required this.attemptsRepository,
  }) : super(TrackingInitial()) {
    on<LoadTrackingEvent>(_onLoadProgress);
    on<FetchAllParaphrasesAttempts>(_fetchAllParaphraseAttempts);
    on<FetchAllMainIdeasAttempts>(_fetchAllMainIdeaAttempts);
    on<FetchAllSummaryAttempts>(_fetchAllSummaryAttempts);
    on<FetchAllFlashCardSessions>(_fetchAllFlashCardSessions);
  }

  Future<void> _onLoadProgress(
    LoadTrackingEvent event,
    Emitter<TrackingState> emit,
  ) async {
    emit(TrackingLoading(operation: TrackingOperation.load));

    final result = await progressRepository.getStudentTrackData(
      userId: event.userId,
      courseId: event.courseId,
    );

    result.fold(
      (failure) {
        emit(
          TrackingError(
            message: failure.message,
            operation: TrackingOperation.load,
          ),
        );
      },
      (trackingData) {
        emit(TrackingLoaded(trackingData: trackingData));
      },
    );
  }

  void _fetchAllParaphraseAttempts(
    FetchAllParaphrasesAttempts event,
    Emitter<TrackingState> emit,
  ) async {
    emit(TrackingLoading(operation: TrackingOperation.allParaphrases));
    final response = await attemptsRepository.getAllParaphraseAttempts(
      aiReadingId: event.aiReadingId,
      targetUserId: event.targetUserId,
    );
    response.fold(
      (l) => emit(
        TrackingError(
          operation: TrackingOperation.allParaphrases,
          message: l.message,
        ),
      ),
      (r) => emit(TrackingAllParaphrasesLoaded(paraphrases: r)),
    );
  }

  void _fetchAllMainIdeaAttempts(
    FetchAllMainIdeasAttempts event,
    Emitter<TrackingState> emit,
  ) async {
    emit(TrackingLoading(operation: TrackingOperation.allMainIdeas));
    final response = await attemptsRepository.getAllMainIdeaAttempts(
      aiReadingId: event.aiReadingId,
      targetUserId: event.targetUserId,
    );
    response.fold(
      (l) => emit(
        TrackingError(
          operation: TrackingOperation.allMainIdeas,
          message: l.message,
        ),
      ),
      (r) => emit(TrackingAllMainIdeasLoaded(mainIdeas: r)),
    );
  }

  void _fetchAllSummaryAttempts(
    FetchAllSummaryAttempts event,
    Emitter<TrackingState> emit,
  ) async {
    emit(TrackingLoading(operation: TrackingOperation.allSummaries));
    final response = await attemptsRepository.getAllSummaryAttempts(
      aiReadingId: event.aiReadingId,
      targetUserId: event.targetUserId,
    );
    response.fold(
      (l) => emit(
        TrackingError(
          operation: TrackingOperation.allSummaries,
          message: l.message,
        ),
      ),
      (r) => emit(TrackingAllSummariesLoaded(summaries: r)),
    );
  }

  void _fetchAllFlashCardSessions(
    FetchAllFlashCardSessions event,
    Emitter<TrackingState> emit,
  ) async {
    emit(TrackingLoading(operation: TrackingOperation.flashCardSessionAll));
    final response = await attemptsRepository.getAllFlashCardSessions(
      flashcardActId: event.flashcardActId,
      targetUserId: event.targetUserId,
    );
    response.fold(
      (l) => emit(
        TrackingError(
          operation: TrackingOperation.flashCardSessionAll,
          message: l.message,
        ),
      ),
      (r) => emit(TrackingAllFlashCardSessions(flashCards: r)),
    );
  }
}
