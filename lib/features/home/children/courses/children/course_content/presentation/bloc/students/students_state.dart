part of 'students_bloc.dart';

@immutable
class StudentsState extends Equatable {
  final UserEntity? professor;
  final List<UserEntity> students;
  final bool isLoading;
  final String? error;

  const StudentsState({
    this.professor,
    this.students = const [],
    this.isLoading = false,
    this.error,
  });

  StudentsState copyWith({
    UserEntity? professor,
    List<UserEntity>? students,
    bool? isLoading,
    String? error,
  }) {
    return StudentsState(
      professor: professor ?? this.professor,
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [professor, students, isLoading, error];
}
