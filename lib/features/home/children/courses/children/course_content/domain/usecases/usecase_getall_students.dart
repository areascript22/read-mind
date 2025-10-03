import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseGetAllStudents
    implements Usecase<List<UserEntity>, GetAllStudentsParams> {
  final CourseContentRepository courseContentRepository;
  const UseCaseGetAllStudents(this.courseContentRepository);
  @override
  Future<Either<Failure, List<UserEntity>>> call(
    GetAllStudentsParams params,
  ) async {
    return await courseContentRepository.getAllStudents(
      courseId: params.courseId,
    );
  }
}

final class GetAllStudentsParams {
  final String courseId;

  GetAllStudentsParams(this.courseId);
}
