import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/paraphrase_attempt_entity.dart';
part 'paraphrase_attempt.freezed.dart';
part 'paraphrase_attempt.g.dart';

@freezed
abstract class ParaphraseAttemptModel with _$ParaphraseAttemptModel {
  const factory ParaphraseAttemptModel({
    required int id,
    required int aiReadingId,
    required int userId,
    required double similarityScore,
    required double fluencyScore,
    required double originalityScore,
    required String feedback,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ParaphraseAttemptModel;

  factory ParaphraseAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$ParaphraseAttemptModelFromJson(json);
}

extension ParaphraseAttemptModelX on ParaphraseAttemptModel {
  ParaphraseAttemptEntity toEntity() {
    return ParaphraseAttemptEntity(
      id: id,
      aiReadingId: aiReadingId,
      userId: userId,
      similarityScore: similarityScore,
      fluencyScore: fluencyScore,
      originalityScore: originalityScore,
      feedback: feedback,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
