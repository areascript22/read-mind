import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../../core/error/failure.dart';

abstract interface class VocabularyRepository {
  Future<Either<Failure, List<TranslationEntity>>> getAllTranslations();
}
