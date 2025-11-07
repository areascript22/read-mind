// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'progress_model.freezed.dart';
// part 'progress_model.g.dart';
//
// @freezed
// abstract class ProgressModel with _$ProgressModel {
//   const factory ProgressModel({
//     required int progressId,
//     required int activityId,
//     required String title,
//     required String? description,
//     required String courseName,
//     required bool completed,
//     required int totalProgress,
//     required int totalScore,
//     required bool hasScoring,
//     required int? maxScore,
//     required String dueDate,
//     required String updatedAt,
//     required SubactivitiesCompletedModel subactivitiesCompleted,
//     required int subactivitiesCompletionRate,
//   }) = _ProgressModel;
//
//   factory ProgressModel.fromJson(Map<String, dynamic> json) =>
//       _$ProgressModelFromJson(json);
// }
//
// @freezed
// abstract class SubactivitiesCompletedModel with _$SubactivitiesCompletedModel {
//   const factory SubactivitiesCompletedModel({
//     required bool reading,
//     required bool paraphrase,
//     required bool mainIdea,
//     required bool summary,
//   }) = _SubactivitiesCompletedModel;
//
//   factory SubactivitiesCompletedModel.fromJson(Map<String, dynamic> json) =>
//       _$SubactivitiesCompletedModelFromJson(json);
// }
//
// // extension ProgressModelExtension on ProgressModel {
// //   ProgressEntity toEntity() {
// //     return ProgressEntity(
// //       progressId: progressId,
// //       activityId: activityId,
// //       title: title,
// //       description: description,
// //       courseName: courseName,
// //       completed: completed,
// //       totalProgress: totalProgress,
// //       totalScore: totalScore,
// //       hasScoring: hasScoring,
// //       maxScore: maxScore,
// //       dueDate: dueDate,
// //       updatedAt: updatedAt,
// //       subactivitiesCompleted: SubactivitiesCompletedEntity(
// //         reading: subactivitiesCompleted.reading,
// //         paraphrase: subactivitiesCompleted.paraphrase,
// //         mainIdea: subactivitiesCompleted.mainIdea,
// //         summary: subactivitiesCompleted.summary,
// //       ),
// //       subactivitiesCompletionRate: subactivitiesCompletionRate,
// //     );
// //   }
// // }
