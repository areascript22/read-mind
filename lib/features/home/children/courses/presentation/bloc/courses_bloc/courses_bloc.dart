import 'package:bloc/bloc.dart';
import 'package:client_app/features/auth/domain/usecases/current_user.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_create_new.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all_enrolled.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'courses_event.dart';

part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final GetAllCourses getAllCourses;
  final CoursesCreateNewUsecase coursesCreatedNew;
  final GetAllEnrolledCourses getAllEnrolledCourses;

  CoursesBloc(
    this.getAllCourses,
    this.coursesCreatedNew,
    this.getAllEnrolledCourses,
  ) : super(CoursesInitial()) {
    on<CoursesEvent>((event, emit) => emit(CourseLoading()));
    on<CoursesGetAllEvent>(_onCoursesGetAll);
    on<CoursesCreateNew>(_onCoursesCreateNew);
    on<CoursesGetAllEnrolledEvent>(_onCoursesGetAllEnrolled);
  }

  void _onCoursesGetAll(
    CoursesGetAllEvent event,
    Emitter<CoursesState> emit,
  ) async {
    final response = await getAllCourses(Noparams());
    response.fold(
      (l) => emit(CourseFailure(message: l.message)),
      (r) => emit(CoursesLoaded(r)),
    );
  }

  void _onCoursesCreateNew(
    CoursesCreateNew event,
    Emitter<CoursesState> emit,
  ) async {
    final createdCourse = await coursesCreatedNew(
      CreateCourseParams(event.title, event.description),
    );
    createdCourse.fold(
      (l) => emit(CourseFailure(message: l.message)),
      (r) => emit(CoursesCreatedNew(r)),
    );
  }

  void _onCoursesGetAllEnrolled(
    CoursesGetAllEnrolledEvent event,
    Emitter<CoursesState> emit,
  ) async {
    final response = await getAllEnrolledCourses(Noparams());
    response.fold(
      (l) => emit(CourseFailure(message: l.message)),
      (r) => emit(CoursesLoaded(r)),
    );
  }
}
