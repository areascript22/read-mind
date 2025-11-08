import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domian/entity/progress_entity.dart';
import '../../../domian/entity/tracking_entity.dart';
import '../../../domian/repository/progress_repository.dart';
part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final ProgressRepository progressRepository;

  ProgressBloc({required this.progressRepository}) : super(ProgressInitial()) {
    on<LoadProgressEvent>(_onLoadProgress);
  }

  Future<void> _onLoadProgress(
    LoadProgressEvent event,
    Emitter<ProgressState> emit,
  ) async {
    emit(ProgressLoading(operation: ProgressOperation.load));

    final result = await progressRepository.getStudentTrackData(
      userId: event.userId,
    );

    result.fold(
      (failure) {
        emit(
          ProgressError(
            message: failure.message,
            operation: ProgressOperation.load,
          ),
        );
      },
      (trackingData) {
        emit(ProgressLoaded(trackingData: trackingData));
      },
    );
  }
}
