import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseRemoveCourse implements Usecase<CourseEntity, RemoveCourseParams>{
  final CoursesRepository coursesRepository;
  const UseCaseRemoveCourse(this.coursesRepository);
  @override
  Future<Either<Failure,CourseEntity>> call(RemoveCourseParams params)async {
    return await coursesRepository.removeCourse(courseId: params.courseId);
  }
}

final class RemoveCourseParams{
  final int courseId;

  RemoveCourseParams(this.courseId);
}