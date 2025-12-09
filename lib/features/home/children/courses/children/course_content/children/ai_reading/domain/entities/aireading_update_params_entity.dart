import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';

class AiReadingUpdateParamsEntity {
  final AIReadingEntity aiReadingEntity;
  final int activityId;

  AiReadingUpdateParamsEntity({
    required this.aiReadingEntity,
    required this.activityId,
  });
}
