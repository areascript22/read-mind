import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/summary_attempt_entity.dart';
part 'summary_attempt.freezed.dart';
part 'summary_attempt.g.dart';

@freezed
abstract class SummaryAttemptModel with _$SummaryAttemptModel {
  const factory SummaryAttemptModel({
    required int id,
    required int aiReadingId,
    required int userId,
    required double accuracyScore,
    required double coverageScore,
    required double clarityScore,
    required String feedback,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SummaryAttemptModel;

  factory SummaryAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryAttemptModelFromJson(json);
}

extension SummaryAttemptModelX on SummaryAttemptModel {
  SummaryAttemptEntity toEntity() => SummaryAttemptEntity(
    id: id,
    aiReadingId: aiReadingId,
    userId: userId,
    accuracyScore: accuracyScore,
    coverageScore: coverageScore,
    clarityScore: clarityScore,
    feedback: feedback,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
