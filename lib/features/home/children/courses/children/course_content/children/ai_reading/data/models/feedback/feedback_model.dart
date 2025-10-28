import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/feedback_entity.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
abstract class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    @JsonKey(name: 'similarity_score') required int similarityScore,
    @JsonKey(name: 'fluency_score') required int fluencyScore,
    @JsonKey(name: 'originality_score') required int originalityScore,
    required String feedback,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}

extension FeedbackModelX on FeedbackModel {
  FeedbackEntity toEntity() {
    return FeedbackEntity(
      similarityScore: similarityScore,
      fluencyScore: fluencyScore,
      originalityScore: originalityScore,
      feedback: feedback,
    );
  }
}
