import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseGetUser implements Usecase<UserEntity, GetUserParams> {
  final CourseContentRepository courseContentRepository;
  const UseCaseGetUser(this.courseContentRepository);
  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await courseContentRepository.getUser(id: params.id);
  }
}

final class GetUserParams {
  final int id;
  GetUserParams(this.id);
}
