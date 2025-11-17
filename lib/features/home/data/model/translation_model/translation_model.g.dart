// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) =>
    _TranslationModel(
      id: (json['id'] as num).toInt(),
      sourceText: json['sourceText'] as String,
      translated: json['translated'] as String,
      sourceLang: json['sourceLang'] as String,
      targetLang: json['targetLang'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      timesUsed: (json['timesUsed'] as num).toInt(),
    );

Map<String, dynamic> _$TranslationModelToJson(_TranslationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceText': instance.sourceText,
      'translated': instance.translated,
      'sourceLang': instance.sourceLang,
      'targetLang': instance.targetLang,
      'createdAt': instance.createdAt.toIso8601String(),
      'timesUsed': instance.timesUsed,
    };
