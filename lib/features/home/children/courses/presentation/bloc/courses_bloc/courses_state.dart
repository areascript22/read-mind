part of 'courses_bloc.dart';

@immutable
sealed class CoursesState extends Equatable {
  const CoursesState();
}

final class CoursesInitial extends CoursesState {
  @override
  List<Object?> get props => [];
}

class CourseLoading extends CoursesState {
  @override
  List<Object?> get props => [];
}

class CourseFailure extends CoursesState {
  final String message;

  const CourseFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class CoursesLoaded extends CoursesState {
  final List<CourseEntity> courses;

   const CoursesLoaded(this.courses);

  @override
  List<Object?> get props => [courses];
}

class CoursesCreatedNew extends CoursesState{
  final CourseEntity course;

  const CoursesCreatedNew(this.course);

  @override
  List<Object?> get props => [course];
}
