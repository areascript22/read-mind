import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseEnrollCourse implements Usecase<String, EnrollCourseParams> {
  final CoursesRepository coursesRepository;
  const UseCaseEnrollCourse(this.coursesRepository);
  @override
  Future<Either<Failure, String>> call(EnrollCourseParams params) async {
    return await coursesRepository.enrollCourse(inviteCode: params.inviteCode);
  }
}

final class EnrollCourseParams {
  final String inviteCode;

  EnrollCourseParams(this.inviteCode);
}
