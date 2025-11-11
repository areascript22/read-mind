class MainIdeaAttemptEntity {
  final int id;
  final int aiReadingId;
  final int userId;
  final double accuracyScore;
  final double clarityScore;
  final double concisenessScore;
  final String feedback;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MainIdeaAttemptEntity({
    required this.id,
    required this.aiReadingId,
    required this.userId,
    required this.accuracyScore,
    required this.clarityScore,
    required this.concisenessScore,
    required this.feedback,
    required this.createdAt,
    required this.updatedAt,
  });
}
