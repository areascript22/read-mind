import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/repository/flash_card_repository.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:flutter/material.dart';
part 'flash_card_event.dart';
part 'flash_card_state.dart';

class FlashCardBloc extends Bloc<FlashCardEvent, FlashCardState> {
  final FlashCardRepository flashCardRepository;
  FlashCardBloc({required this.flashCardRepository})
    : super(const FlashCardState()) {
    on<FlashCardLoadAll>(_onLoadAllCards);
  }

  void _onLoadAllCards(
    FlashCardLoadAll event,
    Emitter<FlashCardState> emit,
  ) async {
    emit(
      state.copyWith(
        isGettingAllCards: true,
        currentFlashCardActivity: null,
        errorMessage: null,
        isCardsLoaded: false,
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
          currentFlashCardActivity: null,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isGettingAllCards: false,
          cards: r,
          isCardsLoaded: true,
          currentFlashCardActivity: event.currentFlashCardActivity,
          errorMessage: null,
        ),
      ),
    );
  }
}
