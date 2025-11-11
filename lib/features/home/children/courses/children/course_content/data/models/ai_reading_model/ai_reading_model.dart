import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/ai_reading_entity.dart';

part 'ai_reading_model.freezed.dart';
part 'ai_reading_model.g.dart';

@freezed
abstract class AIReadingModel with _$AIReadingModel {
  const factory AIReadingModel({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AIReadingModel;

  factory AIReadingModel.fromJson(Map<String, dynamic> json) =>
      _$AIReadingModelFromJson(json);
}

extension AIReadingModelX on AIReadingModel {
  AIReadingEntity toEntity() => AIReadingEntity(
    id: id,
    title: title,
    description: description,
    dueDate: dueDate,
    aiReadingId: 0,
    content: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
    length: '',
    complexity: '',
    style: '',
  );
}
