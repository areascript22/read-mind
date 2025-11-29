class FlashCardEntity {
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final int flashCardActivityId;
  final int maxCards;
  final String cardOrder;
  final bool hasScoring;
  final int? maxScore;
  final DateTime createdAt;
  final DateTime updatedAt;

  FlashCardEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.flashCardActivityId,
    required this.maxCards,
    required this.cardOrder,
    required this.hasScoring,
    required this.maxScore,
    required this.createdAt,
    required this.updatedAt,
  });
}
