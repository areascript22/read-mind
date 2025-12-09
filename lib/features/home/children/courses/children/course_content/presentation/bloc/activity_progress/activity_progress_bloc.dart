import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/activity_progress_repository.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:flutter/material.dart';

part 'activity_progress_event.dart';
part 'activity_progress_state.dart';

class ActivityProgressBloc
    extends Bloc<ActivityProgressEvent, ActivityProgressState> {
  final ActivityProgressRepository activityProgressRepository;
  ActivityProgressBloc({required this.activityProgressRepository})
    : super(ActivityProgressInitial()) {
    on<CreateInitialProgressEvent>(_createInitialProgress);
    on<UpdateProgressEvent>(_updateProgress);
  }
  void _createInitialProgress(
    CreateInitialProgressEvent event,
    Emitter<ActivityProgressState> emit,
  ) async {
    emit(
      ProgressLoading(
        operation: ProgressActOperation.create,
        aiReadingId: event.aiReadingId,
      ),
    );

    final isOverdue = await activityProgressRepository.isActivityOverdue(
      activityId: event.activityId,
    );
    bool isOverdueTemp = false;
    isOverdue.fold(
      (l) {
        emit(
          ProgressError(
            message: l.message,
            operation: ProgressActOperation.create,
            aiReadingId: event.aiReadingId,
          ),
        );
      },
      (r) {
        isOverdueTemp = r;
        if (isOverdueTemp) {
          emit(ProgressActivityOverdue(aiReadingId: event.aiReadingId));
        }
      },
    );

    if (isOverdue.isLeft()) {
      return;
    }

    if (isOverdueTemp) {
      return;
    }

    final result = await activityProgressRepository
        .createInitialActivityProgress(aiReadingId: event.aiReadingId);

    result.fold(
      (f) {
        emit(
          ProgressError(
            message: f.message,
            operation: ProgressActOperation.create,
            aiReadingId: event.aiReadingId,
          ),
        );
      },
      (r) {
        emit(
          ProgressCreated(createdProgress: r, aiReadingId: event.aiReadingId),
        );
      },
    );
  }

  void _updateProgress(
    UpdateProgressEvent event,
    Emitter<ActivityProgressState> emit,
  ) async {
    emit(
      ProgressLoading(
        operation: ProgressActOperation.update,
        aiReadingId: event.aiReadingId,
      ),
    );

    final result = await activityProgressRepository.updateActivityProgress(
      aiReadingId: event.aiReadingId,
      dataToUpdate: event.dataToUpdate,
    );

    result.fold(
      (f) {
        emit(
          ProgressError(
            message: f.message,
            operation: ProgressActOperation.update,
            aiReadingId: event.aiReadingId,
          ),
        );
      },
      (r) {
        emit(
          ProgressUpdated(updatedProgress: r, aiReadingId: event.aiReadingId),
        );
      },
    );
  }
}
