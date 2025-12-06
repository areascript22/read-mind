import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../auth/domain/usecases/current_user.dart';

class GetAllEnrolledCourses implements Usecase<List<CourseEntity>, Noparams>{
  final CoursesRepository coursesRepository;
  const GetAllEnrolledCourses(this.coursesRepository);
  @override
  Future<Either<Failure,List<CourseEntity>>> call(Noparams params)async {
    return await coursesRepository.getAllEnrolledCourses();
  }
}
