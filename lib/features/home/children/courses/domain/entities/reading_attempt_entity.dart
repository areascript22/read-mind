class ReadingAttemptEntity {
  final int id;
  final int aiReadingId;
  final int userId;
  final int timeSpentSec;
  final int playCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReadingAttemptEntity({
    required this.id,
    required this.aiReadingId,
    required this.userId,
    required this.timeSpentSec,
    required this.playCount,
    required this.createdAt,
    required this.updatedAt,
  });
}
