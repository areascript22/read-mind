import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseUnEnrollCourse implements Usecase<String, UnEnrollCourseParams> {
  final CoursesRepository coursesRepository;
  const UseCaseUnEnrollCourse(this.coursesRepository);
  @override
  Future<Either<Failure, String>> call(UnEnrollCourseParams params) async {
    return await coursesRepository.unEnrollCourse(courseId: params.courseId);
  }
}

final class UnEnrollCourseParams {
  final int courseId;

  UnEnrollCourseParams(this.courseId);
}
