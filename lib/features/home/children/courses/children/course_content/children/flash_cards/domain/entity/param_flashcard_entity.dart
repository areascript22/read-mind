import '../../../../../../../../domain/entity/translation_entity.dart';

class ParamFlashCardEntity {
  final List<TranslationEntity> translations;
  final int activityId;

  ParamFlashCardEntity({required this.translations, required this.activityId});
}
