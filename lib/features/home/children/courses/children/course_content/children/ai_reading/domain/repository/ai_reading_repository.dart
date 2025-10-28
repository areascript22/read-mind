import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_mainidea_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_summary_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AiReadingRepository {
  Future<Either<Failure, FeedbackEntity>> evaluateParaphrase({
    required String paragraph,
    required String paraphrase,
  });

  Future<Either<Failure, FeedbackMainIdeaEntity>> evaluateMainIdea({
    required String paragraph,
    required String mainIdea,
  });

  Future<Either<Failure, FeedbackSummaryEntity>> evaluateSummary({
    required String paragraph,
    required String summary,
  });
}
