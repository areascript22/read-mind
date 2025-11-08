import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/activity_progress_repository.dart';
import 'package:meta/meta.dart';

import '../../../../student_tracking/domian/entity/progress_entity.dart';

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
    emit(ProgressLoading(operation: ProgressActOperation.create));

    final result = await activityProgressRepository
        .createInitialActivityProgress(activityId: event.activityId);

    result.fold(
      (f) {
        emit(
          ProgressError(
            message: f.message,
            operation: ProgressActOperation.create,
          ),
        );
      },
      (r) {
        emit(ProgressCreated(createdProgress: r));
      },
    );
  }

  void _updateProgress(
    UpdateProgressEvent event,
    Emitter<ActivityProgressState> emit,
  ) async {
    emit(ProgressLoading(operation: ProgressActOperation.update));

    final result = await activityProgressRepository.updateActivityProgress(
      activityId: event.activityId,
      dataToUpdate: event.dataToUpdate,
    );

    result.fold(
      (f) {
        emit(
          ProgressError(
            message: f.message,
            operation: ProgressActOperation.update,
          ),
        );
      },
      (r) {
        emit(ProgressUpdated(updatedProgress: r));
      },
    );
  }
}
