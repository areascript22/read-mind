part of 'course_content_bloc.dart';

@immutable
sealed class CourseContentState {}

final class CourseContentInitial extends CourseContentState {}

final class CourseContentLoading extends CourseContentState {}

final class CourseContentLoaded extends CourseContentState {
  final CourseEntity course;

   CourseContentLoaded({
    required this.course,
  });
}

final class CourseContentError extends CourseContentState {
  final String message;

   CourseContentError(this.message);
}

final class CourseContentCodeUpdated extends CourseContentState{
  final String inviteCode;

  CourseContentCodeUpdated(this.inviteCode);
}
