import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/flash_card_entity.dart';

class FlashCardUpdateParamsEntity {
  final FlashCardEntity flashCardentity;
  final int activityId;

  FlashCardUpdateParamsEntity({
    required this.flashCardentity,
    required this.activityId,
  });
}
