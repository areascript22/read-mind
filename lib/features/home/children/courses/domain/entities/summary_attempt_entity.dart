class SummaryAttemptEntity {
  final int id;
  final int aiReadingId;
  final int userId;
  final double accuracyScore;
  final double coverageScore;
  final double clarityScore;
  final String feedback;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SummaryAttemptEntity({
    required this.id,
    required this.aiReadingId,
    required this.userId,
    required this.accuracyScore,
    required this.coverageScore,
    required this.clarityScore,
    required this.feedback,
    required this.createdAt,
    required this.updatedAt,
  });
}
