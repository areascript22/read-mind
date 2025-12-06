part of 'course_content_bloc.dart';

enum CCActions {
  getAllStudents,
  generateParagraph,
  createAiReading,
  getAllActivities,
  getUser,
}

@immutable
sealed class CourseContentState {}

final class CourseContentInitial extends CourseContentState {}

final class CourseContentLoading extends CourseContentState {
  final CCActions actions;

  CourseContentLoading(this.actions);
}

final class CourseContentLoaded extends CourseContentState {
  final CourseEntity course;

  CourseContentLoaded({required this.course});
}

final class CourseContentError extends CourseContentState {
  final String message;
  final CCActions actions;

  CourseContentError(this.message, this.actions);
}

final class CourseContentStudentsLoaded extends CourseContentState {
  final List<UserEntity> students;

  CourseContentStudentsLoaded(this.students);
}

final class CourseContentParagraphGenerated extends CourseContentState {
  final String paragraph;

  CourseContentParagraphGenerated(this.paragraph);
}

final class CourseContentAiReadingCreated extends CourseContentState {
  final AIReadingEntity aiReadingEntity;

  CourseContentAiReadingCreated(this.aiReadingEntity);
}

final class CourseContentActivitiesLoaded extends CourseContentState {
  final List<ActivityModel> activities;

  CourseContentActivitiesLoaded(this.activities);
}

final class CourseContentUserLoaded extends CourseContentState {
  final UserEntity user;

  CourseContentUserLoaded(this.user);
}
