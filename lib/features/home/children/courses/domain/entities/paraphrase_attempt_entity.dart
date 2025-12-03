class ParaphraseAttemptEntity {
  final int id;
  final int aiReadingId;
  final int userId;
  final double similarityScore;
  final double fluencyScore;
  final double originalityScore;
  final String feedback;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int averageScore;
  final int timeSpentSec;

  const ParaphraseAttemptEntity({
    required this.id,
    required this.aiReadingId,
    required this.userId,
    required this.similarityScore,
    required this.fluencyScore,
    required this.originalityScore,
    required this.feedback,
    required this.createdAt,
    required this.updatedAt,
    required this.averageScore,
    required this.timeSpentSec,
  });
}
