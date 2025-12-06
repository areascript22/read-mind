import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/repository/flash_card_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/flash_card_entity.dart';
import 'package:flutter/material.dart';
part 'flashcard_creation_state.dart';

class FlashcardCreationCubit extends Cubit<FlashcardCreationState> {
  final FlashCardRepository flashCardRepository;
  FlashcardCreationCubit({required this.flashCardRepository})
    : super(FlashcardCreationInitial());

  void createFlashCardActivity({
    required int courseId,
    required String title,
    required String description,
    required String dueDate,
    required bool hasScoring,
    required int maxScore,
    required int maxCards,
    required String cardOrder,
  }) async {
    emit(FlashcardCreationLoading());
    final response = await flashCardRepository.createFlashCardActivity(
      courseId: courseId,
      title: title,
      description: description,
      dueDate: dueDate,
      hasScoring: hasScoring,
      maxScore: maxScore,
      maxCards: maxCards,
      cardOrder: cardOrder,
    );

    response.fold(
      (l) => emit(FlashcardCreationError(message: l.message)),
      (r) => emit(FlashcardCreationSuccess(flashCardEntity: r)),
    );
  }
}
