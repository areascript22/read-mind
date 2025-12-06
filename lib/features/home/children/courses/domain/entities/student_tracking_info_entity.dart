import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';

class StudentTrackingInfoEntity {
  final UserEntity user;
  final CourseEntity course;

  StudentTrackingInfoEntity({required this.user, required this.course});
}
