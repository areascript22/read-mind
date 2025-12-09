import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/activity_date_repository.dart';
import 'package:flutter/material.dart';

part 'flashcard_date_state.dart';

class FlashCardDateCubit extends Cubit<DateState> {
  final ActivityDateRepository activityDateRepository;
  FlashCardDateCubit({required this.activityDateRepository})
    : super(DateInitial());

  void checkActivityOverdue({
    required int activityId,
    required int flashCardActivity,
  }) async {
    emit(DateLoadingState(currentFlashCardActivity: flashCardActivity));
    final response = await activityDateRepository.isActivityOverdue(
      activityId: activityId,
    );
    response.fold(
      (l) => emit(
        DateErrorState(
          message: l.message,
          currentFlashCardActivity: flashCardActivity,
        ),
      ),
      (r) => emit(
        DateSuccess(isOverdue: r, currentFlashCardActivity: flashCardActivity),
      ),
    );
  }
}
