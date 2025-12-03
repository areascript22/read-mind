class FlashCardSessionEntity {
  final int id;
  final int flashCardActivityId;
  final int studentId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int totalTimeSec;
  final int cardsCompleted;
  final int correctAnswers;
  final int incorrectAnswers;
  final int score;

  FlashCardSessionEntity({
    required this.id,
    required this.flashCardActivityId,
    required this.studentId,
    required this.startedAt,
    required this.completedAt,
    required this.totalTimeSec,
    required this.cardsCompleted,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.score,
  });
}
