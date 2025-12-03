import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/flash_card_entity.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@Freezed(unionKey: 'type')
abstract class ActivityModel with _$ActivityModel {
  const factory ActivityModel.aIReading({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    required int aiReadingId,
    required String content,
    required String length, // New field
    required String complexity, // New field
    required String style, // New field
    required DateTime createdAt,
    required DateTime updatedAt,
    required double? totalScore,
  }) = AIReadingModel;

  const factory ActivityModel.flashCard({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    required bool hasScoring,
    int? maxScore,
    required DateTime createdAt,
    required DateTime updatedAt,

    // FLASHCARD SPECIFIC
    required int flashCardActivityId,
    required int maxCards,
    required String cardOrder,
    required double? bestScore,
  }) = FlashCardModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}

extension ActivityEntityMapper on ActivityModel {
  // -------- AI READING --------
  AIReadingEntity? toAIReadingEntity() => maybeMap(
    aIReading:
        (m) => AIReadingEntity(
          id: m.id,
          title: m.title,
          description: m.description,
          dueDate: m.dueDate,
          aiReadingId: m.aiReadingId,
          content: m.content,
          length: m.length,
          complexity: m.complexity,
          style: m.style,
          createdAt: m.createdAt,
          updatedAt: m.updatedAt,
          totalScore: m.totalScore,
        ),
    orElse: () => null,
  );

  FlashCardEntity? toFlashCardEntity() => maybeMap(
    flashCard:
        (m) => FlashCardEntity(
          id: m.id,
          title: m.title,
          description: m.description,
          dueDate: m.dueDate,
          flashCardActivityId: m.flashCardActivityId,
          maxCards: m.maxCards,
          cardOrder: m.cardOrder,
          hasScoring: m.hasScoring,
          maxScore: m.maxScore,
          createdAt: m.createdAt,
          updatedAt: m.updatedAt,
          bestScore: m.bestScore,
        ),
    orElse: () => null,
  );
}
