import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../../../../core/error/failure.dart';

abstract interface class ActivityProgressRepository {
  Future<Either<Failure, ProgressModel>> createInitialActivityProgress({
    required int aiReadingId,
  });
  Future<Either<Failure, ProgressModel>> updateActivityProgress({
    required int aiReadingId,
    required Map dataToUpdate,
  });
}
