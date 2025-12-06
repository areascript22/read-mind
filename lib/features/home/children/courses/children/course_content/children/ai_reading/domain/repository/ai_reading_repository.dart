import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_mainidea_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_summary_entity.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AiReadingRepository {
  Future<Either<Failure, FeedbackEntity>> evaluateParaphrase({
    required String paragraph,
    required String paraphrase,
    required int activityId,
  });

  Future<Either<Failure, FeedbackMainIdeaEntity>> evaluateMainIdea({
    required String paragraph,
    required String mainIdea,
    required int activityId,
  });

  Future<Either<Failure, FeedbackSummaryEntity>> evaluateSummary({
    required String paragraph,
    required String summary,
    required int activityId,
  });

  Future<Either<Failure, TranslationEntity>> translateWord({
    required String text,
    required int readingId,
  });
}
