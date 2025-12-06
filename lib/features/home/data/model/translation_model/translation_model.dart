import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entity/translation_entity.dart';
part 'translation_model.freezed.dart';
part 'translation_model.g.dart';

@freezed
abstract class TranslationModel with _$TranslationModel {
  const factory TranslationModel({
    required int id,
    required String sourceText,
    required String translated,
    required String sourceLang,
    required String targetLang,
    required DateTime createdAt,
    required int timesUsed,
  }) = _TranslationModel;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);
}

extension TranslationModelX on TranslationModel {
  TranslationEntity toEntity() {
    return TranslationEntity(
      id: id,
      sourceText: sourceText,
      translated: translated,
      sourceLang: sourceLang,
      targetLang: targetLang,
      createdAt: createdAt,
      timesUsed: timesUsed,
    );
  }
}
