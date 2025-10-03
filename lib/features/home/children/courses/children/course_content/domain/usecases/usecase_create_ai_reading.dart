import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../../../../core/common/entities/user_entity.dart';
import '../entities/ai_reading_entity.dart';

class UseCaseCreateAIReading
    implements Usecase<AIReadingEntity, CreateAIReadingParams> {
  final CourseContentRepository courseContentRepository;
  const UseCaseCreateAIReading(this.courseContentRepository);
  @override
  Future<Either<Failure, AIReadingEntity>> call(
    CreateAIReadingParams params,
  ) async {
    return await courseContentRepository.createAiReading(
      courseId: params.courseId,
      title: params.title,
      description: params.description,
      content: params.content,
      dueDate: params.dueDate,
    );
  }
}

final class CreateAIReadingParams {
  final String courseId;
  final String title;
  final String description;
  final String content;
  final String dueDate;

  CreateAIReadingParams(
    this.courseId,
    this.title,
    this.description,
    this.content,
    this.dueDate,
  );
}
