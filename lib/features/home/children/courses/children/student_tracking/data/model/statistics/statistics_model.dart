import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domian/entity/statistics_entity.dart';
part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

@freezed
abstract class StatisticsModel with _$StatisticsModel {
  const factory StatisticsModel({
    required int total,
    required int completed,
    required int inProgress,
    required int notStarted,
    required double averageScore,
    required int completionRate,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);
}

extension StatisticsModelExtension on StatisticsModel {
  StatisticsEntity toEntity() {
    return StatisticsEntity(
      total: total,
      completed: completed,
      inProgress: inProgress,
      notStarted: notStarted,
      averageScore: averageScore,
      completionRate: completionRate,
    );
  }
}
