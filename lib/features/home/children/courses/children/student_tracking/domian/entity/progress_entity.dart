class ProgressEntity {
  final int progressId;
  final int activityId;
  final int aiReadingId;
  final String title;
  final String? description;
  final String courseName;
  final bool completed;
  final int totalProgress;
  final int totalScore;
  final bool hasScoring;
  final int? maxScore;
  final String dueDate;
  final String updatedAt;
  final SubactivitiesCompletedEntity subactivitiesCompleted;
  final int subactivitiesCompletionRate;

  ProgressEntity({
    required this.progressId,
    required this.activityId,
    required this.aiReadingId,
    required this.title,
    required this.description,
    required this.courseName,
    required this.completed,
    required this.totalProgress,
    required this.totalScore,
    required this.hasScoring,
    required this.maxScore,
    required this.dueDate,
    required this.updatedAt,
    required this.subactivitiesCompleted,
    required this.subactivitiesCompletionRate,
  });
}

class SubactivitiesCompletedEntity {
  final bool reading;
  final bool paraphrase;
  final bool mainIdea;
  final bool summary;

  SubactivitiesCompletedEntity({
    required this.reading,
    required this.paraphrase,
    required this.mainIdea,
    required this.summary,
  });
}
