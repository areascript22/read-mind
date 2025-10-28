import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:fpdart/fpdart.dart';

class UseCaseGenerateParagraph
    implements Usecase<String, GenerateParagraphParams> {
  final CourseContentRepository courseContentRepository;
  const UseCaseGenerateParagraph(this.courseContentRepository);
  @override
  Future<Either<Failure, String>> call(GenerateParagraphParams params) async {
    return await courseContentRepository.generateParagraph(
      topic: params.topic,
      length: params.length,
      complexity: params.complexity,
      style: params.style,
    );
  }
}

final class GenerateParagraphParams {
  final String topic;
  final String length;
  final String complexity;
  final String style;

  GenerateParagraphParams(this.topic, this.length, this.complexity, this.style);
}
