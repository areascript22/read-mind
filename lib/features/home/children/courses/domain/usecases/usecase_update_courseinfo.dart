import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseUpdateCourseInfo
    implements Usecase<CourseEntity, UpdateCourseInfoParams> {
  final CoursesRepository coursesRepository;

  const UseCaseUpdateCourseInfo(this.coursesRepository);

  @override
  Future<Either<Failure, CourseEntity>> call(
    UpdateCourseInfoParams params,
  ) async {
    return await coursesRepository.updateCourseInfo(
      courseId: params.courseId,
      title: params.title,
      description: params.description,
    );
  }
}

final class UpdateCourseInfoParams {
  final String courseId;
  final String title;
  final String description;

  UpdateCourseInfoParams(this.title, this.description, this.courseId);
}
