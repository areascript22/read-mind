part of 'course_content_bloc.dart';

@immutable
sealed class CourseContentEvent {}

final class LoadCourseEvent extends CourseContentEvent {
  final String courseId;

  LoadCourseEvent(this.courseId);
}

final class EventGetAllStudents extends CourseContentEvent {
  final String courseId;

  EventGetAllStudents(this.courseId);
}

final class EventGenerateParagraph extends CourseContentEvent {
  final String topic;

  EventGenerateParagraph(this.topic);
}

final class EventUpdateState extends CourseContentEvent {
  final CourseContentState state;

  EventUpdateState(this.state);
}

final class EventCreateAIReading extends CourseContentEvent {
  final String courseId;
  final String title;
  final String description;
  final String content;
  final String dueDate;

  EventCreateAIReading(
    this.courseId,
    this.title,
    this.description,
    this.content,
    this.dueDate,
  );
}

final class EventGetAllActivities extends CourseContentEvent {
  final String courseId;
  EventGetAllActivities(this.courseId);
}
