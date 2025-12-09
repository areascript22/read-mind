import 'package:fpdart/fpdart.dart';
import '../../../../../../../../core/error/failure.dart';

abstract interface class ActivityDateRepository {
  Future<Either<Failure, bool>> isActivityOverdue({required int activityId});
}
