import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/entities/main_idea_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/paraphrase_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/summary_attempt_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AttemptsRepository {
  Future<Either<Failure, ParaphraseAttemptEntity>> createParaphraseAttempt({
    required int aiReadingId,
    required int similarityScore,
    required int fluencyScore,
    required int originalityScore,
    required String feedback,
  });

  Future<Either<Failure, MainIdeaAttemptEntity>> createMainIdeaAttempt({
    required int aiReadingId,
    required int accuracyScore,
    required int clarityScore,
    required int concisenessScore,
    required String feedback,
  });

  Future<Either<Failure, SummaryAttemptEntity>> createSummaryAttempt({
    required int aiReadingId,
    required int accuracyScore,
    required int coverageScore,
    required int clarityScore,
    required String feedback,
  });

  Future<Either<Failure, List<ParaphraseAttemptEntity>>>
  getAllParaphraseAttempts();
  Future<Either<Failure, List<MainIdeaAttemptEntity>>> getAllMainIdeaAttempts();
  Future<Either<Failure, List<SummaryAttemptEntity>>> getAllSummaryAttempts();
}
