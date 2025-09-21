import 'package:client_app/core/error/failure.dart';
import 'package:client_app/core/error/server_exception.dart';
import 'package:client_app/features/home/children/courses/data/datasources/courses_remote_datasource.dart';
import 'package:client_app/features/home/children/courses/data/models/course/course_model.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/src/either.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesRemoteDatasource remoteDatasource;
  final AuthLocalDataSource authLocalDataSource;

  const CoursesRepositoryImpl(this.remoteDatasource, this.authLocalDataSource);

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.getAllCourses(token);
      return Right(response.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> createCourse({
    required String title,
    required String description,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final createdCourse = await remoteDatasource.createNewCourse(
        token: token,
        title: title,
        description: description,
      );
      return right(createdCourse.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllEnrolledCourses() async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.getAllEnrolledCourses(token);
      return Right(response.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> removeCourse({
    required int courseId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.removeCourse(
        token: token,
        id: courseId,
      );
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> updateCourseInfo({
    required String courseId,
    required String title,
    required String description,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.updateCourseInfo(
        token: token,
        courseId: courseId,
        title: title,
        description: description,
      );
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> updateCourseInviteCode({
    required int courseId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.updateInviteCode(
        token: token,
        courseId: courseId,
      );
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> enrollCourse({
    required String inviteCode,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.enrollACourse(
        token: token,
        inviteCode: inviteCode,
      );
      return Right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> unEnrollCourse({
    required int courseId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await remoteDatasource.unEnrollACourse(
        token: token,
        courseId: courseId.toString(),
      );
      return Right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
