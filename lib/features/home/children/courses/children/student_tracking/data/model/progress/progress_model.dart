import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/flash_card_progress_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domian/entity/progress_entity.dart';
part 'progress_model.freezed.dart';
part 'progress_model.g.dart';

@Freezed(unionKey: 'type')
abstract class ProgressModel with _$ProgressModel {
  const factory ProgressModel.aiReadingProgress({
    required int progressId,
    required int activityId,
    required int aiReadingId,
    required String title,
    required String? description,
    required bool completed,
    required int totalProgress,
    required int totalScore,
    required bool hasScoring,
    required int? maxScore,
    required String dueDate,
    required String updatedAt,
    required SubactivitiesCompletedModel subactivitiesCompleted,
    required int subactivitiesCompletionRate,
  }) = AiReadingProgress;

  const factory ProgressModel.flashCardProgress({
    required int id,
    required int activityId,
    required int flashCardActivityId,
    required String title,
    required String? description,
    required String cardOrder,
    required int maxCards,
    required bool completed,
    required int progressPercentage,
    required int totalScore,
    required bool hasScoring,
    required int? maxScore,
    required String dueDate,
    required String startedAt,
    required String completedAt,
    required StatsModel stats,
  }) = FlashCardProgress;

  factory ProgressModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressModelFromJson(json);
}

@freezed
abstract class SubactivitiesCompletedModel with _$SubactivitiesCompletedModel {
  const factory SubactivitiesCompletedModel({
    required bool reading,
    required bool paraphrase,
    required bool mainIdea,
    required bool summary,
  }) = _SubactivitiesCompletedModel;

  factory SubactivitiesCompletedModel.fromJson(Map<String, dynamic> json) =>
      _$SubactivitiesCompletedModelFromJson(json);
}

@freezed
abstract class StatsModel with _$StatsModel {
  const factory StatsModel({
    required int totalAttempts,
    required int correctAnswers,
    required int incorrectAnswers,
    required int totalTimeSec,
    required int avgTimePerCard,
    required int confidenceScore,
  }) = _StatsModel;

  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);
}

extension ActivityEntityMapper on ProgressModel {
  ReadingProgressEntity? toReadingProgressEntity() => maybeMap(
    aiReadingProgress:
        (m) => ReadingProgressEntity(
          progressId: m.progressId,
          activityId: m.activityId,
          aiReadingId: m.aiReadingId,
          title: m.title,
          description: m.description,
          completed: m.completed,
          totalProgress: m.totalProgress,
          totalScore: m.totalScore,
          hasScoring: m.hasScoring,
          maxScore: m.maxScore,
          dueDate: m.dueDate,
          updatedAt: m.updatedAt,
          subactivitiesCompleted: SubactivitiesCompletedEntity(
            reading: m.subactivitiesCompleted.reading,
            paraphrase: m.subactivitiesCompleted.paraphrase,
            mainIdea: m.subactivitiesCompleted.mainIdea,
            summary: m.subactivitiesCompleted.summary,
          ),
          subactivitiesCompletionRate: m.subactivitiesCompletionRate,
        ),
    orElse: () => null,
  );

  FlashCardProgressEntity? toFlashCardProgressEntity() => maybeMap(
    flashCardProgress:
        (m) => FlashCardProgressEntity(
          id: m.id,
          activityId: m.activityId,
          flashCardActivityId: m.flashCardActivityId,
          title: m.title,
          description: m.description,
          cardOrder: m.cardOrder,
          maxCards: m.maxCards,
          completed: m.completed,
          progressPercentage: m.progressPercentage,
          totalScore: m.totalScore,
          hasScoring: m.hasScoring,
          maxScore: m.maxScore,
          dueDate: m.dueDate,
          startedAt: m.startedAt,
          completedAt: m.completedAt,
          stats: StatsEntity(
            totalAttempts: m.stats.totalAttempts,
            correctAnswers: m.stats.correctAnswers,
            incorrectAnswers: m.stats.incorrectAnswers,
            totalTimeSec: m.stats.totalTimeSec,
            avgTimePerCard: m.stats.avgTimePerCard,
            confidenceScore: m.stats.confidenceScore,
          ),
        ),
    orElse: () => null,
  );
}
