import 'package:bloc/bloc.dart';
import 'package:client_app/features/auth/domain/usecases/current_user.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final GetAllCourses getAllCourses;
  CoursesBloc(this.getAllCourses) : super(CoursesInitial()) {
    on<CoursesEvent>((event, emit) => emit(CourseLoading()));
    on<CoursesGetAll>(_onCoursesGetAll);
  }

  void _onCoursesGetAll(CoursesGetAll event, Emitter<CoursesState> emit) async {
    final response = await getAllCourses(Noparams());
    response.fold((l) => emit(CourseFailure(message: l.message)), (r) => emit(CoursesLoaded(r)),);
  }
}
