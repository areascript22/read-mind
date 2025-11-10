part of 'ai_reading_progress_cubit.dart';

@immutable
class AiReadingProgressState {
  final bool isLoading;
  final Map<int, ActivityCompletionEntity> progressByActivity;

  const AiReadingProgressState({
    this.isLoading = false,
    this.progressByActivity = const {
      0: ActivityCompletionEntity(
        aiReading: false,
        paraphrase: false,
        mainIdea: false,
        summary: false,
      ),
    },
  });

  AiReadingProgressState copyWith({
    bool? isLoading,
    Map<int, ActivityCompletionEntity>? progressByActivity,
  }) {
    return AiReadingProgressState(
      isLoading: isLoading ?? this.isLoading,
      progressByActivity: progressByActivity ?? this.progressByActivity,
    );
  }

  AiReadingProgressState updateActivity(
    int id,
    ActivityCompletionEntity entity,
  ) {
    final updated = Map<int, ActivityCompletionEntity>.from(progressByActivity);
    updated[id] = entity;
    return copyWith(progressByActivity: updated);
  }

  bool isActivityCompleted(int id) {
    final a = progressByActivity[id];
    if (a == null) return false;
    return a.aiReading && a.paraphrase && a.mainIdea && a.summary;
  }
}
