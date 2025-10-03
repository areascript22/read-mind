// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AIReadingModel _$AIReadingModelFromJson(Map<String, dynamic> json) =>
    _AIReadingModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AIReadingModelToJson(_AIReadingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate.toIso8601String(),
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
