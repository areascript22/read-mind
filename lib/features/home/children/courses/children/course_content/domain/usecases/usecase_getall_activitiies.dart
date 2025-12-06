import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseGetAllActivities
    implements Usecase<List<ActivityModel>, GetAllActivitiesParams> {
  final CourseContentRepository courseContentRepository;
  const UseCaseGetAllActivities(this.courseContentRepository);
  @override
  Future<Either<Failure, List<ActivityModel>>> call(
    GetAllActivitiesParams params,
  ) async {
    return await courseContentRepository.getAllActivities(
      courseId: params.courseId,
    );
  }
}

final class GetAllActivitiesParams {
  final String courseId;

  GetAllActivitiesParams(this.courseId);
}
