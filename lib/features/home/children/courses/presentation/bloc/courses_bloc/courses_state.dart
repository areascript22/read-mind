part of 'courses_bloc.dart';

enum CourseAction {
  updateCode,
  delete,
  getAll,
  updateInfo,
  createNew,
  enroll,
  unEnroll,
}

@immutable
sealed class CoursesState extends Equatable {
  const CoursesState();
}

final class CoursesInitial extends CoursesState {
  @override
  List<Object?> get props => [];
}

class CourseLoading extends CoursesState {
  final CourseAction courseAction;

  const CourseLoading(this.courseAction);

  @override
  List<Object?> get props => [courseAction];
}

class CourseFailure extends CoursesState {
  final CourseAction courseAction;
  final String message;

  const CourseFailure({required this.message, required this.courseAction});

  @override
  List<Object?> get props => [message];
}

class CoursesLoaded extends CoursesState {
  final List<CourseEntity> courses;

  const CoursesLoaded(this.courses);

  @override
  List<Object?> get props => [courses];
}

class CoursesCreatedNew extends CoursesState {
  final CourseEntity course;

  const CoursesCreatedNew(this.course);

  @override
  List<Object?> get props => [course];
}

class CourseRemovedState extends CoursesState {
  final CourseEntity courseEntity;

  const CourseRemovedState(this.courseEntity);

  @override
  List<Object?> get props => [courseEntity];
}

class CourseUpdatedState extends CoursesState {
  final CourseEntity courseEntity;

  const CourseUpdatedState(this.courseEntity);

  @override
  List<Object?> get props => [courseEntity];
}

class CourseEnrolledState extends CoursesState {
  final String message;

  const CourseEnrolledState(this.message);

  @override
  List<Object?> get props => [message];
}

class CourseUnEnrolledState extends CoursesState {
  final String message;

  const CourseUnEnrolledState(this.message);

  @override
  List<Object?> get props => [message];
}
