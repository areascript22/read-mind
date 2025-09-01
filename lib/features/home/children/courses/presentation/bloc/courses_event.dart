part of 'courses_bloc.dart';

@immutable
sealed class CoursesEvent extends Equatable {
  const CoursesEvent();
}

class CoursesGetAll extends CoursesEvent {
  const CoursesGetAll();

  @override
  List<Object?> get props => [];
}

class CoursesCreateNew extends CoursesEvent {
  final String token;
  final String title;
  final String description;
  final String professorId;

  const CoursesCreateNew({
    required this.token,
    required this.title,
    required this.description,
    required this.professorId,
  });

  @override
  List<Object?> get props => [token, title, description, professorId];
}

class CoursesUpdateInfo extends CoursesEvent {
  final String token;
  final String courseId;
  final String name;
  final String description;

  const CoursesUpdateInfo({
    required this.token,
    required this.courseId,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [token, courseId, name, description];
}

class CoursesRemoveById extends CoursesEvent {
  final String token;
  final String courseId;

  const CoursesRemoveById({
    required this.token,
    required this.courseId,
  });

  @override
  List<Object?> get props => [token, courseId];
}

class CoursesAskForProfessorRole extends CoursesEvent {
  final String token;

  const CoursesAskForProfessorRole({required this.token});

  @override
  List<Object?> get props => [token];
}

class CoursesCheckRequestRoleStatus extends CoursesEvent {
  final String token;

  const CoursesCheckRequestRoleStatus({required this.token});

  @override
  List<Object?> get props => [token];
}

class CoursesEnroll extends CoursesEvent {
  final int courseId;
  final String token;

  const CoursesEnroll({
    required this.courseId,
    required this.token,
  });

  @override
  List<Object?> get props => [courseId, token];
}
