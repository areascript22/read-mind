import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/feedback_summary_entity.dart';

part 'feedback_summary.freezed.dart';
part 'feedback_summary.g.dart';

@freezed
abstract class FeedbackSummary with _$FeedbackSummary {
  const factory FeedbackSummary({
    @JsonKey(name: 'accuracy_score') required int accuracyScore,
    @JsonKey(name: 'coverage_score') required int coverageScore,
    @JsonKey(name: 'clarity_score') required int clarityScore,
    required String feedback,
  }) = _FeedbackSummary;

  factory FeedbackSummary.fromJson(Map<String, dynamic> json) =>
      _$FeedbackSummaryFromJson(json);
}

extension FeedbackSummaryX on FeedbackSummary {
  FeedbackSummaryEntity toEntity() {
    return FeedbackSummaryEntity(
      accuracyScore: accuracyScore,
      coverageScore: coverageScore,
      clarityScore: clarityScore,
      feedback: feedback,
    );
  }
}
