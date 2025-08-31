import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
abstract class CourseModel with _$CourseModel {
  const factory CourseModel({
    required int id,
    required String name,
    required String description,
    required String inviteCode,
    required int teacherId,
    required DateTime createdAt,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}

extension CourseModelX on CourseModel {
  CourseEntity toEntity() => CourseEntity(
    id: id,
    name: name,
    description: description,
    inviteCode: inviteCode,
    teacherId: teacherId,
    createdAt: createdAt,
  );
}
