import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/main_idea_attempt_entity.dart';

part 'main_idea_attempt.freezed.dart';
part 'main_idea_attempt.g.dart';

@freezed
abstract class MainIdeaAttemptModel with _$MainIdeaAttemptModel {
  const factory MainIdeaAttemptModel({
    required int id,
    required int aiReadingId,
    required int userId,
    required double accuracyScore,
    required double clarityScore,
    required double concisenessScore,
    required String feedback,
    required DateTime createdAt,
    required DateTime updatedAt,
    required double averageScore,
    required int timeSpentSec,
  }) = _MainIdeaAttemptModel;

  factory MainIdeaAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$MainIdeaAttemptModelFromJson(json);
}

extension MainIdeaAttemptModelX on MainIdeaAttemptModel {
  MainIdeaAttemptEntity toEntity() => MainIdeaAttemptEntity(
    id: id,
    aiReadingId: aiReadingId,
    userId: userId,
    accuracyScore: accuracyScore,
    clarityScore: clarityScore,
    concisenessScore: concisenessScore,
    feedback: feedback,
    createdAt: createdAt,
    updatedAt: updatedAt,
    averageScore: averageScore,
    timeSpentSec: timeSpentSec,
  );
}
