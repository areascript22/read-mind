import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
@Freezed(unionKey: 'type')
abstract class ActivityModel with _$ActivityModel {
  const factory ActivityModel.aIReading({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = AIReadingModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}

extension ActivityModelX on ActivityModel {
  AIReadingEntity toAIReadingEntity() => AIReadingEntity(
    id: id,
    title: title,
    description: description,
    dueDate: dueDate,
    content: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
