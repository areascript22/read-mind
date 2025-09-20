part of 'courses_bloc.dart';

@immutable
sealed class CoursesEvent extends Equatable {
  const CoursesEvent();
}

class CoursesGetAllEvent extends CoursesEvent {
  const CoursesGetAllEvent();

  @override
  List<Object?> get props => [];
}

class CoursesGetAllEnrolledEvent extends CoursesEvent {
  const CoursesGetAllEnrolledEvent();

  @override
  List<Object?> get props => [];
}

class CoursesCreateNewEvent extends CoursesEvent {
  final String title;
  final String description;

  const CoursesCreateNewEvent(this.title, this.description);

  @override
  List<Object?> get props => [];
}

class CoursesUpdateInfoEvent extends CoursesEvent {
  final String courseId;
  final String name;
  final String description;

  const CoursesUpdateInfoEvent({
    required this.courseId,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [courseId, name, description];
}

class CoursesRemoveEvent extends CoursesEvent {
  final int courseId;

  const CoursesRemoveEvent({required this.courseId});

  @override
  List<Object?> get props => [courseId];
}

class CoursesUpdateInviteCodeEvent extends CoursesEvent {
  final int courseId;

  const CoursesUpdateInviteCodeEvent({required this.courseId});

  @override
  List<Object?> get props => [courseId];
}

class CoursesAskForProfessorRoleEvent extends CoursesEvent {
  final String token;

  const CoursesAskForProfessorRoleEvent({required this.token});

  @override
  List<Object?> get props => [token];
}

class CoursesCheckRequestRoleStatus extends CoursesEvent {
  final String token;

  const CoursesCheckRequestRoleStatus({required this.token});

  @override
  List<Object?> get props => [token];
}

class CoursesEnrollEvent extends CoursesEvent {
  final int courseId;
  final String token;

  const CoursesEnrollEvent({required this.courseId, required this.token});

  @override
  List<Object?> get props => [courseId, token];
}
