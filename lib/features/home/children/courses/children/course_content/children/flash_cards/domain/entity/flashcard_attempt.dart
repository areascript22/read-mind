class FlashcardAttemptEntity {
  final int id;
  final int sessionId;
  final int userTranslationId;
  final String userAnswer;
  final bool isCorrect;
  final int timeSpentSec;
  final DateTime createdAt;

  FlashcardAttemptEntity({
    required this.id,
    required this.sessionId,
    required this.userTranslationId,
    required this.userAnswer,
    required this.isCorrect,
    required this.timeSpentSec,
    required this.createdAt,
  });

  /// Entidad vacía para estados iniciales, comparaciones, etc.
  factory FlashcardAttemptEntity.empty() {
    return FlashcardAttemptEntity(
      id: 0,
      sessionId: 0,
      userTranslationId: 0,
      userAnswer: '',
      isCorrect: false,
      timeSpentSec: 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
