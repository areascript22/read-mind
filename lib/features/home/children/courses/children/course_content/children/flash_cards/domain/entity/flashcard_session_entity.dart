class FlashcardSessionEntity {
  final int id;
  final int flashCardActivityId;
  final int studentId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int totalTimeSec;
  final int cardsCompleted;
  final int correctAnswers;
  final int incorrectAnswers;
  final double? confidenceScore;

  FlashcardSessionEntity({
    required this.id,
    required this.flashCardActivityId,
    required this.studentId,
    required this.startedAt,
    this.completedAt,
    required this.totalTimeSec,
    required this.cardsCompleted,
    required this.correctAnswers,
    required this.incorrectAnswers,
    this.confidenceScore,
  });

  /// Constructor factory para obtener una sesión vacía (default)
  factory FlashcardSessionEntity.empty() {
    return FlashcardSessionEntity(
      id: 0,
      flashCardActivityId: 0,
      studentId: 0,
      startedAt: DateTime.fromMillisecondsSinceEpoch(0),
      completedAt: null,
      totalTimeSec: 0,
      cardsCompleted: 0,
      correctAnswers: 0,
      incorrectAnswers: 0,
      confidenceScore: null,
    );
  }
}
