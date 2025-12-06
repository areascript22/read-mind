class ActivityCompletionEntity {
  final bool aiReading;
  final bool paraphrase;
  final bool mainIdea;
  final bool summary;

  const ActivityCompletionEntity({
    required this.aiReading,
    required this.paraphrase,
    required this.mainIdea,
    required this.summary,
  });

  ActivityCompletionEntity copyWith({
    bool? aiReading,
    bool? paraphrase,
    bool? mainIdea,
    bool? summary,
  }) {
    return ActivityCompletionEntity(
      aiReading: aiReading ?? this.aiReading,
      paraphrase: paraphrase ?? this.paraphrase,
      mainIdea: mainIdea ?? this.mainIdea,
      summary: summary ?? this.summary,
    );
  }
}
