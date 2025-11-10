import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/activities_completion_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_local_repository.dart';
import 'package:flutter/material.dart';

part 'ai_reading_progress_state.dart';

class AiReadingProgressCubit extends Cubit<AiReadingProgressState> {
  final AiReadingLocalRepository aiReadingLocalRepository;

  AiReadingProgressCubit({required this.aiReadingLocalRepository})
    : super(const AiReadingProgressState());

  Future<void> loadAiReadingProgress(int activityId) async {
    emit(state.copyWith(isLoading: true));
    final response = await aiReadingLocalRepository.isAiReadingCompleted(
      activityId: activityId,
    );

    response.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
      final updatedActivity =
          state.progressByActivity[activityId]?.copyWith(aiReading: r) ??
          ActivityCompletionEntity(
            aiReading: r,
            paraphrase: false,
            mainIdea: false,
            summary: false,
          );
      emit(
        state
            .updateActivity(activityId, updatedActivity)
            .copyWith(isLoading: false),
      );
    });
  }

  Future<void> setAiReadingProgress(int activityId) async {
    emit(state.copyWith(isLoading: true));
    final response = await aiReadingLocalRepository.setAiReadingCompletion(
      activityId: activityId,
    );

    response.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
      final updatedActivity =
          state.progressByActivity[activityId]?.copyWith(aiReading: r) ??
          ActivityCompletionEntity(
            aiReading: r,
            paraphrase: false,
            mainIdea: false,
            summary: false,
          );
      emit(
        state
            .updateActivity(activityId, updatedActivity)
            .copyWith(isLoading: false),
      );
    });
  }

  void loadMainIdeaProgress(int activityId) async {
    emit(state.copyWith(isLoading: true));
    final response = await aiReadingLocalRepository.isAiMainIdeaCompleted(
      activityId: activityId,
    );
    response.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
      final updatedActivity =
          state.progressByActivity[activityId]?.copyWith(mainIdea: r) ??
          ActivityCompletionEntity(
            aiReading: true,
            paraphrase: true,
            mainIdea: true,
            summary: false,
          );
      emit(
        state
            .updateActivity(activityId, updatedActivity)
            .copyWith(isLoading: false),
      );
    });
  }

  void loadParaphraseProgress(int activityId) async {
    emit(state.copyWith(isLoading: true));
    final response = await aiReadingLocalRepository.isAiParaphraseCompleted(
      activityId: activityId,
    );
    response.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
      final updatedActivity =
          state.progressByActivity[activityId]?.copyWith(paraphrase: r) ??
          ActivityCompletionEntity(
            aiReading: true,
            paraphrase: true,
            mainIdea: false,
            summary: false,
          );
      emit(
        state
            .updateActivity(activityId, updatedActivity)
            .copyWith(isLoading: false),
      );
    });
  }

  void loadSummaryProgress(int activityId) async {
    emit(state.copyWith(isLoading: true));
    final response = await aiReadingLocalRepository.isAiSummaryCompleted(
      activityId: activityId,
    );
    response.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
      final updatedActivity =
          state.progressByActivity[activityId]?.copyWith(summary: r) ??
          ActivityCompletionEntity(
            aiReading: true,
            paraphrase: true,
            mainIdea: true,
            summary: true,
          );
      emit(
        state
            .updateActivity(activityId, updatedActivity)
            .copyWith(isLoading: false),
      );
    });
  }
}
