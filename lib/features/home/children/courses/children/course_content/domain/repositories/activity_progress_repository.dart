import 'package:fpdart/fpdart.dart';
import '../../../../../../../../core/error/failure.dart';
import '../../../student_tracking/domian/entity/progress_entity.dart';

abstract interface class ActivityProgressRepository {
  Future<Either<Failure, ProgressEntity>> createInitialActivityProgress({
    required int aiReadingId,
  });
  Future<Either<Failure, ProgressEntity>> updateActivityProgress({
    required int aiReadingId,
    required Map dataToUpdate,
  });
}
