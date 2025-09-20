import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../auth/domain/usecases/current_user.dart';

class CoursesCreateNewUsecase implements Usecase<CourseEntity, CreateCourseParams>{
  final CoursesRepository coursesRepository;
  const CoursesCreateNewUsecase(this.coursesRepository);
  @override
  Future<Either<Failure,CourseEntity>> call(CreateCourseParams params) async {
    return await coursesRepository.createCourse(title: params.title, description: params.description);
  }
}

final class CreateCourseParams{
  final String title;
  final String description;

  CreateCourseParams(this.title, this.description);
}
