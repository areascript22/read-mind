import 'package:client_app/core/error/failure.dart';
import 'package:client_app/core/error/server_exception.dart';
import 'package:client_app/features/home/children/courses/data/datasources/courses_remote_datasource.dart';
import 'package:client_app/features/home/children/courses/data/models/course/course_model.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/src/either.dart';

class CoursesRepositoryImpl implements CoursesRepository{
  final CoursesRemoteDatasource remoteDatasource;
  final AuthLocalDataSource authLocalDataSource;
  const CoursesRepositoryImpl(this.remoteDatasource, this.authLocalDataSource);

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try{
      final token = await authLocalDataSource.getJwt();
      if(token == null){
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.getAllCourses(token);
      return Right(response.map((e)=> e.toEntity()).toList());
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }

}