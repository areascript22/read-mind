import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/feedback_mainidea_entity.dart';

part 'feedback_mainidea.freezed.dart';
part 'feedback_mainidea.g.dart';

@freezed
abstract class FeedbackMainIdea with _$FeedbackMainIdea {
  const factory FeedbackMainIdea({
    @JsonKey(name: 'accuracy_score') required int accuracyScore,
    @JsonKey(name: 'clarity_score') required int clarityScore,
    @JsonKey(name: 'conciseness_score') required int concisenessScore,
    required String feedback,
  }) = _FeedbackMainIdea;

  factory FeedbackMainIdea.fromJson(Map<String, dynamic> json) =>
      _$FeedbackMainIdeaFromJson(json);
}

extension FeedbackMainIdeaMapper on FeedbackMainIdea {
  FeedbackMainIdeaEntity toEntity() {
    return FeedbackMainIdeaEntity(
      accuracyScore: accuracyScore,
      clarityScore: clarityScore,
      concisenessScore: concisenessScore,
      feedback: feedback,
    );
  }
}
