class FeedbackEntity {
  final int similarityScore;
  final int fluencyScore;
  final int originalityScore;
  final String feedback;

  const FeedbackEntity({
    required this.similarityScore,
    required this.fluencyScore,
    required this.originalityScore,
    required this.feedback,
  });
}
