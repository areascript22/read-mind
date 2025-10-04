import 'package:bloc/bloc.dart';
import 'package:client_app/features/auth/domain/usecases/current_user.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_create_new.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all_enrolled.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_enroll_course.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_remove_course.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_unenroll_course.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_update_courseinfo.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_update_invitecode.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'courses_event.dart';

part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final GetAllCourses getAllCourses;
  final CoursesCreateNewUsecase coursesCreatedNew;
  final GetAllEnrolledCourses getAllEnrolledCourses;
  final UseCaseRemoveCourse useCaseRemoveCourse;
  final UseCaseUpdateInviteCode useCaseUpdateInviteCode;
  final UseCaseUpdateCourseInfo useCaseUpdateCourseInfo;
  final UseCaseEnrollCourse useCaseEnrollCourse;
  final UseCaseUnEnrollCourse useCaseUnEnrollCourse;

  CoursesBloc(
    this.getAllCourses,
    this.coursesCreatedNew,
    this.getAllEnrolledCourses,
    this.useCaseRemoveCourse,
    this.useCaseUpdateInviteCode,
    this.useCaseUpdateCourseInfo,
    this.useCaseEnrollCourse,
    this.useCaseUnEnrollCourse,
  ) : super(CoursesInitial()) {
    on<CoursesGetAllEvent>(_onCoursesGetAll);
    on<CoursesCreateNewEvent>(_onCoursesCreateNew);
    on<CoursesGetAllEnrolledEvent>(_onCoursesGetAllEnrolled);
    on<CoursesRemoveEvent>(_onCoursesRemove);
    on<CoursesUpdateInviteCodeEvent>(_onCourseUpdateInviteCode);
    on<CoursesUpdateInfoEvent>(_onCoursesUpdateInfo);
    on<CoursesEnrollEvent>(_onCoursesEnroll);
    on<CoursesUnEnrollEvent>(_onCoursesUnEnroll);
  }

  void _onCoursesGetAll(
    CoursesGetAllEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.getAll));
    final response = await getAllCourses(Noparams());
    response.fold(
      (l) => emit(
        CourseFailure(message: l.message, courseAction: CourseAction.getAll),
      ),
      (r) => emit(CoursesLoaded(r)),
    );
  }

  void _onCoursesCreateNew(
    CoursesCreateNewEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.getAll));
    final createdCourse = await coursesCreatedNew(
      CreateCourseParams(event.title, event.description),
    );
    createdCourse.fold(
      (l) => emit(
        CourseFailure(message: l.message, courseAction: CourseAction.createNew),
      ),
      (r) => emit(CoursesCreatedNew(r)),
    );
  }

  void _onCoursesGetAllEnrolled(
    CoursesGetAllEnrolledEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.getAll));
    final response = await getAllEnrolledCourses(Noparams());
    response.fold(
      (l) => emit(
        CourseFailure(message: l.message, courseAction: CourseAction.getAll),
      ),
      (r) => emit(CoursesLoaded(r)),
    );
  }

  void _onCoursesRemove(
    CoursesRemoveEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.delete));
    final response = await useCaseRemoveCourse(
      RemoveCourseParams(event.courseId),
    );
    response.fold(
      (l) => emit(
        CourseFailure(message: l.message, courseAction: CourseAction.delete),
      ),
      (r) => emit(CourseRemovedState(r)),
    );
  }

  void _onCourseUpdateInviteCode(
    CoursesUpdateInviteCodeEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.updateCode));
    final response = await useCaseUpdateInviteCode(
      UpdateInviteCodeParams(event.courseId),
    );

    response.fold(
      (l) => emit(
        CourseFailure(
          message: l.message,
          courseAction: CourseAction.updateCode,
        ),
      ),
      (r) => emit(CourseUpdatedState(r)),
    );
  }

  void _onCoursesUpdateInfo(
    CoursesUpdateInfoEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.updateInfo));
    final response = await useCaseUpdateCourseInfo(
      UpdateCourseInfoParams(event.name, event.description, event.courseId),
    );
    response.fold(
      (l) => emit(
        CourseFailure(
          message: l.message,
          courseAction: CourseAction.updateInfo,
        ),
      ),
      (r) => emit(CourseUpdatedState(r)),
    );
  }

  void _onCoursesEnroll(
    CoursesEnrollEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.enroll));
    final response = await useCaseEnrollCourse(
      EnrollCourseParams(event.inviteCode),
    );
    response.fold(
      (l) => emit(
        CourseFailure(message: l.message, courseAction: CourseAction.enroll),
      ),
      (r) => emit(CourseEnrolledState(r)),
    );
  }

  void _onCoursesUnEnroll(
    CoursesUnEnrollEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseLoading(CourseAction.unEnroll));
    final response = await useCaseUnEnrollCourse(
      UnEnrollCourseParams(event.courseId),
    );
    response.fold(
      (l) => emit(
        CourseFailure(message: l.message, courseAction: CourseAction.unEnroll),
      ),
      (r) => emit(CourseUnEnrolledState(r)),
    );
  }
}
