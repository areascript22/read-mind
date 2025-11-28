import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_session_entity.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FlashCardRepository {
  Future<Either<Failure, List<TranslationEntity>>> loadFlashCards({
    required int limit,
    required String order,
  });

  Future<Either<Failure, FlashcardSessionEntity>> createFlashCardSession({
    required int activityId,
  });

  Future<Either<Failure, FlashcardSessionEntity>> completeFlashCardSession({
    required int sessionId,
  });
}
