import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../../../../core/error/failure.dart';
import '../entities/ai_reading_entity.dart';

abstract interface class CourseContentRepository {
  Future<Either<Failure, List<UserEntity>>> getAllStudents({
    required String courseId,
  });

  Future<Either<Failure, AIReadingEntity>> createAiReading({
    required String courseId,
    required String title,
    required String description,
    required String content,
    required String dueDate,
  });

  Future<Either<Failure, String>> generateParagraph({required String topic});

  Future<Either<Failure, List<ActivityModel>>> getAllActivities({
    required String courseId,
  });

  Future<Either<Failure, UserEntity>> getUser({required int id});
}
