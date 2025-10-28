class FeedbackSummaryEntity {
  final int accuracyScore;
  final int coverageScore;
  final int clarityScore;
  final String feedback;

  FeedbackSummaryEntity({
    required this.accuracyScore,
    required this.coverageScore,
    required this.clarityScore,
    required this.feedback,
  });
}
