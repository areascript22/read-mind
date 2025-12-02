class FlashCardProgressEntity {
  final int id;
  final int activityId;
  final int flashCardActivityId;
  final String title;
  final String? description;
  final String cardOrder;
  final int maxCards;
  final bool completed;
  final int progressPercentage;
  final int totalScore;
  final bool hasScoring;
  final int? maxScore;
  final String dueDate;
  final String startedAt;
  final String completedAt;
  final StatsEntity stats;

  const FlashCardProgressEntity({
    required this.id,
    required this.activityId,
    required this.flashCardActivityId,
    required this.title,
    required this.description,
    required this.cardOrder,
    required this.maxCards,
    required this.completed,
    required this.progressPercentage,
    required this.totalScore,
    required this.hasScoring,
    required this.maxScore,
    required this.dueDate,
    required this.startedAt,
    required this.completedAt,
    required this.stats,
  });
}

class StatsEntity {
  final int totalAttempts;
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalTimeSec;
  final int avgTimePerCard;
  final int confidenceScore;

  const StatsEntity({
    required this.totalAttempts,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalTimeSec,
    required this.avgTimePerCard,
    required this.confidenceScore,
  });
}
