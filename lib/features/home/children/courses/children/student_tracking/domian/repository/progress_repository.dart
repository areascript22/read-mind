import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/tracking_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProgressRepository {
  Future<Either<Failure, TrackingEntity>> getStudentTrackData({
    required int userId,
  });
}
