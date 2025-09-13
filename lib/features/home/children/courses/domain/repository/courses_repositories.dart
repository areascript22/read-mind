import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CoursesRepository {
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();

  Future<Either<Failure, List<CourseEntity>>> getAllEnrolledCourses();

  Future<Either<Failure, CourseEntity>> createCourse({
    required String title,
    required String description,
  });
}
