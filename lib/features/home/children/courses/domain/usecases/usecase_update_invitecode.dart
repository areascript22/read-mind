import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseUpdateInviteCode
    implements Usecase<CourseEntity, UpdateInviteCodeParams> {
  final CoursesRepository coursesRepository;

  const UseCaseUpdateInviteCode(this.coursesRepository);

  @override
  Future<Either<Failure, CourseEntity>> call(
    UpdateInviteCodeParams params,
  ) async {
    return await coursesRepository.updateCourseInviteCode(
      courseId: params.courseId,
    );
  }
}

final class UpdateInviteCodeParams {
  final int courseId;

  UpdateInviteCodeParams(this.courseId);
}
