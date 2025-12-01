import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_session_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/repository/flash_card_repository.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/flashcard_attempt.dart';
part 'flash_card_event.dart';
part 'flash_card_state.dart';

class FlashCardBloc extends Bloc<FlashCardEvent, FlashCardState> {
  final FlashCardRepository flashCardRepository;
  FlashCardBloc({required this.flashCardRepository})
    : super(
        FlashCardState(
          currentFlashcardSession: FlashcardSessionEntity.empty(),
          currentFlashcardAttempt: FlashcardAttemptEntity.empty(),
        ),
      ) {
    on<FlashCardLoadAll>(_onLoadAllCards);
    on<FlashCardCreateInitialSession>(_createInitialSession);
    on<FlashCardReCreateInitialSession>(_reCreateInitialSession);
    on<FlashCardCompleteSession>(_completeSession);
    on<FlashCardCreateAttempt>(_createAttempt);
  }

  void _onLoadAllCards(
    FlashCardLoadAll event,
    Emitter<FlashCardState> emit,
  ) async {
    emit(
      state.copyWith(
        isGettingAllCards: true,
        currentFlashCardActivity: event.currentFlashCardActivity,
        errorMessage: '',
        isCardsLoaded: false,
        flashCardAction: FlashCardAction.loadAll,
      ),
    );
    final response = await flashCardRepository.loadFlashCards(
      limit: event.limit,
      order: event.order,
    );
    response.fold(
      (l) => emit(
        state.copyWith(
          isGettingAllCards: false,
          errorMessage: l.message,
          currentFlashCardActivity: 0,
          isCardsLoaded: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isGettingAllCards: false,
          cards: r,
          isCardsLoaded: true,
          currentFlashCardActivity: event.currentFlashCardActivity,
          errorMessage: '',
        ),
      ),
    );
  }

  void _createInitialSession(
    FlashCardCreateInitialSession event,
    Emitter<FlashCardState> emit,
  ) async {
    emit(
      state.copyWith(
        isCreatingInitialSession: true,
        currentFlashcardSession: FlashcardSessionEntity.empty(),
        errorInitialSession: '',
        flashCardAction: FlashCardAction.initSession,
        isInitialSessionCreated: false,
      ),
    );
    final response = await flashCardRepository.createFlashCardSession(
      activityId: event.activityId,
    );
    response.fold(
      (l) => emit(
        state.copyWith(
          isCreatingInitialSession: false,
          errorInitialSession: l.message,
          currentFlashcardSession: FlashcardSessionEntity.empty(),
          isInitialSessionCreated: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isCreatingInitialSession: false,
          errorInitialSession: '',
          currentFlashcardSession: r,
          isInitialSessionCreated: true,
        ),
      ),
    );
  }

  void _reCreateInitialSession(
    FlashCardReCreateInitialSession event,
    Emitter<FlashCardState> emit,
  ) async {
    emit(
      state.copyWith(
        isCreatingInitialSession: true,
        currentFlashcardSession: FlashcardSessionEntity.empty(),
        errorInitialSession: '',
        flashCardAction: FlashCardAction.reInitSession,
        isInitialSessionCreated: false,
      ),
    );
    final response = await flashCardRepository.createFlashCardSession(
      activityId: event.activityId,
    );
    response.fold(
      (l) => emit(
        state.copyWith(
          isCreatingInitialSession: false,
          errorInitialSession: l.message,
          currentFlashcardSession: FlashcardSessionEntity.empty(),
          isInitialSessionCreated: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isCreatingInitialSession: false,
          errorInitialSession: '',
          currentFlashcardSession: r,
          isInitialSessionCreated: true,
        ),
      ),
    );
  }

  void _completeSession(
    FlashCardCompleteSession event,
    Emitter<FlashCardState> emit,
  ) async {
    emit(
      state.copyWith(
        isCompletingSession: true,
        errorCompleteSession: '',
        flashCardAction: FlashCardAction.completeSession,
        isSessionCompleted: false,
      ),
    );
    final response = await flashCardRepository.completeFlashCardSession(
      sessionId: event.sessionId,
    );
    response.fold(
      (l) => emit(
        state.copyWith(
          isCompletingSession: false,
          errorCompleteSession: l.message,
          isSessionCompleted: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          errorCompleteSession: '',
          isCompletingSession: false,
          currentFlashcardSession: r,
          isSessionCompleted: true,
        ),
      ),
    );
  }

  void _createAttempt(
    FlashCardCreateAttempt event,
    Emitter<FlashCardState> emit,
  ) async {
    emit(
      state.copyWith(
        isSavingCardAttempt: true,
        errorSaveCardAttempt: '',
        currentFlashcardAttempt: FlashcardAttemptEntity.empty(),
        flashCardAction: FlashCardAction.createAttempt,
      ),
    );
    final response = await flashCardRepository.createFlashCardAttempt(
      sessionId: event.sessionId,
      userTranslationId: event.userTranslationId,
      userAnswer: event.userAnswer,
      timeSpentSec: event.timeSpentSec,
      isCorrect: event.isCorrect,
    );

    response.fold(
      (l) => emit(
        state.copyWith(
          isSavingCardAttempt: false,
          errorSaveCardAttempt: l.message,
          currentFlashcardAttempt: FlashcardAttemptEntity.empty(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          isSavingCardAttempt: false,
          errorSaveCardAttempt: '',
          currentFlashcardAttempt: r,
        ),
      ),
    );
  }
}
