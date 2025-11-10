import 'package:fpdart/fpdart.dart';
import '../../../../../../../../../../core/error/failure.dart';

abstract interface class AiReadingLocalRepository {
  Future<Either<Failure, bool>> isAiReadingCompleted({required int activityId});
  Future<Either<Failure, bool>> isAiParaphraseCompleted({
    required int activityId,
  });
  Future<Either<Failure, bool>> isAiMainIdeaCompleted({
    required int activityId,
  });
  Future<Either<Failure, bool>> isAiSummaryCompleted({required int activityId});
}
