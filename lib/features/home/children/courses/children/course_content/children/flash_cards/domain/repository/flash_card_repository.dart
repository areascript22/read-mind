import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FlashCardRepository {
  Future<Either<Failure, List<TranslationEntity>>> loadFlashCards({
    required int limit,
    required String order,
  });
}
