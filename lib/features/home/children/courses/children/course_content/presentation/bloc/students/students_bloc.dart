import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final CourseContentRepository courseContentRepository;

  StudentsBloc({required this.courseContentRepository})
    : super(const StudentsState()) {
    on<EventGetProfessor>(_onGetProfessor);
    on<EventLoadAllStudents>(_onLoadAllStudents);
  }

  Future<void> _onGetProfessor(
    EventGetProfessor event,
    Emitter<StudentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final professor = await courseContentRepository.getUser(id: event.id);
    professor.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.message)),
      (r) => emit(state.copyWith(isLoading: false, professor: r)),
    );
  }

  Future<void> _onLoadAllStudents(
    EventLoadAllStudents event,
    Emitter<StudentsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final students = await courseContentRepository.getAllStudents(
      courseId: event.courseId.toString(),
    );
    students.fold(
      (l) => emit(
        state.copyWith(isLoading: false, error: l.message, students: []),
      ),
      (r) => emit(state.copyWith(isLoading: false, students: r)),
    );
  }
}
