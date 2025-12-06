import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/reading_attempt_entity.dart';
part 'reading_attempt.freezed.dart';
part 'reading_attempt.g.dart';

@freezed
abstract class ReadingAttempt with _$ReadingAttempt {
  const factory ReadingAttempt({
    required int id,
    required int aiReadingId,
    required int userId,
    required int timeSpentSec,
    required int playCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReadingAttempt;

  factory ReadingAttempt.fromJson(Map<String, dynamic> json) =>
      _$ReadingAttemptFromJson(json);
}

extension ReadingAttemptX on ReadingAttempt {
  ReadingAttemptEntity toEntity() {
    return ReadingAttemptEntity(
      id: id,
      aiReadingId: aiReadingId,
      userId: userId,
      timeSpentSec: timeSpentSec,
      playCount: playCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
