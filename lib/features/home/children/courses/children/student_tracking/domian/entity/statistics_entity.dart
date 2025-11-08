class StatisticsEntity {
  final int total;
  final int completed;
  final int inProgress;
  final int notStarted;
  final double averageScore;
  final int totalActivitiesWithScoring;
  final int completionRate;

  StatisticsEntity({
    required this.total,
    required this.completed,
    required this.inProgress,
    required this.notStarted,
    required this.averageScore,
    required this.totalActivitiesWithScoring,
    required this.completionRate,
  });
}
