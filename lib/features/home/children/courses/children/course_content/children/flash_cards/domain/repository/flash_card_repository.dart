import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_attempt.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_session_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/flash_card_entity.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FlashCardRepository {
  Future<Either<Failure, List<TranslationEntity>>> loadFlashCards({
    required int limit,
    required String order,
  });

  Future<Either<Failure, FlashCardEntity>> createFlashCardActivity({
    required int courseId,
    required String title,
    required String description,
    required String dueDate,
    required bool hasScoring,
    required int maxScore,
    required int maxCards,
    required String cardOrder,
  });

  Future<Either<Failure, FlashcardSessionEntity>> createFlashCardSession({
    required int activityId,
  });

  Future<Either<Failure, FlashcardSessionEntity>> completeFlashCardSession({
    required int sessionId,
  });

  Future<Either<Failure, FlashcardAttemptEntity>> createFlashCardAttempt({
    required int sessionId,
    required int userTranslationId,
    required String userAnswer,
    required int timeSpentSec,
    required bool isCorrect,
  });
}
