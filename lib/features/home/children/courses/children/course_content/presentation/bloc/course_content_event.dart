part of 'course_content_bloc.dart';

@immutable
sealed class CourseContentEvent {}

final class LoadCourseEvent extends CourseContentEvent{
  final String courseId;

  LoadCourseEvent(this.courseId);

}