part of 'students_bloc.dart';

@immutable
sealed class StudentsEvent {}

final class EventGetProfessor extends StudentsEvent {
  final int id;
  EventGetProfessor(this.id);
}

final class EventLoadAllStudents extends StudentsEvent {
  final int courseId;
  EventLoadAllStudents(this.courseId);
}
