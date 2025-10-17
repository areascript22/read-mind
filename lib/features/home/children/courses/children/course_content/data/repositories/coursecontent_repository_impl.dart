import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/auth/data/models/user_model/user_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../../../../core/error/server_exception.dart';
import '../../domain/repositories/course_content_repository.dart';
import '../datasources/coursecontent_remote_datasource.dart';

class CourseContentRepositoryImpl implements CourseContentRepository {
  final CourseContentRemoteDataSource courseContentRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  CourseContentRepositoryImpl(
    this.courseContentRemoteDataSource,
    this.authLocalDataSource,
  );

  @override
  Future<Either<Failure, List<UserEntity>>> getAllStudents({
    required String courseId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await courseContentRemoteDataSource.getAllStudents(
        token: token,
        courseId: courseId,
      );
      return Right(response.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, AIReadingEntity>> createAiReading({
    required String courseId,
    required String title,
    required String description,
    required String content,
    required String dueDate,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await courseContentRemoteDataSource.createAIReading(
        token: token,
        courseId: courseId,
        title: title,
        description: description,
        content: content,
        dueDate: dueDate,
      );
      return Right(response.toAIReadingEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> generateParagraph({
    required String topic,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await courseContentRemoteDataSource.generateParagraph(
        token: token,
        topic: topic,
      );
      return Right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ActivityModel>>> getAllActivities({
    required String courseId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await courseContentRemoteDataSource.getAllActivities(
        token: token,
        courseId: courseId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser({required int id}) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesion de nuevo"));
      }
      final response = await courseContentRemoteDataSource.getUser(
        token: token,
        id: id,
      );
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
