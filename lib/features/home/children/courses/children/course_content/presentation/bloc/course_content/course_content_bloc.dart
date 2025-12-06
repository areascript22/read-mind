import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_create_ai_reading.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_generate_paragraph.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_get_user.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_getall_activitiies.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_getall_students.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/course_entity.dart';
import '../../../domain/entities/ai_reading_entity.dart';

part 'course_content_event.dart';
part 'course_content_state.dart';

class CourseContentBloc extends Bloc<CourseContentEvent, CourseContentState> {
  final UseCaseGetAllStudents useCaseGetAllStudents;
  final UseCaseGenerateParagraph useCaseGenerateParagraph;
  final UseCaseCreateAIReading useCaseCreateAIReading;
  final UseCaseGetAllActivities useCaseGetAllActivities;
  final UseCaseGetUser useCaseGetUser;

  CourseContentBloc({
    required this.useCaseGetAllStudents,
    required this.useCaseGenerateParagraph,
    required this.useCaseCreateAIReading,
    required this.useCaseGetAllActivities,
    required this.useCaseGetUser,
  }) : super(CourseContentInitial()) {
    on<LoadCourseEvent>(_onLoadCourse);
    on<EventGetAllStudents>(_onGetAllStudents);
    on<EventGenerateParagraph>(_onGenerateParagraph);
    on<EventUpdateState>(_onUpdateState);
    on<EventCreateAIReading>(_onCreateAIReading);
    on<EventGetAllActivities>(_onGetAllActivities);
  }

  void _onLoadCourse(LoadCourseEvent event, Emitter<CourseContentState> emit) {}

  void _onGetAllStudents(
    EventGetAllStudents event,
    Emitter<CourseContentState> emit,
  ) async {
    emit(CourseContentLoading(CCActions.getAllStudents));
    final response = await useCaseGetAllStudents(
      GetAllStudentsParams(event.courseId),
    );
    response.fold(
      (l) => emit(CourseContentError(l.message, CCActions.getAllStudents)),
      (r) => emit(CourseContentStudentsLoaded(r)),
    );
  }

  void _onGenerateParagraph(
    EventGenerateParagraph event,
    Emitter<CourseContentState> emit,
  ) async {
    emit(CourseContentLoading(CCActions.generateParagraph));
    final response = await useCaseGenerateParagraph(
      GenerateParagraphParams(
        event.topic,
        event.length,
        event.complexity,
        event.style,
      ),
    );
    response.fold(
      (l) => emit(CourseContentError(l.message, CCActions.generateParagraph)),
      (r) => emit(CourseContentParagraphGenerated(r)),
    );
  }

  void _onUpdateState(
    EventUpdateState event,
    Emitter<CourseContentState> emit,
  ) {
    emit(event.state);
  }

  void _onCreateAIReading(
    EventCreateAIReading event,
    Emitter<CourseContentState> emit,
  ) async {
    emit(CourseContentLoading(CCActions.createAiReading));
    final response = await useCaseCreateAIReading(
      CreateAIReadingParams(
        event.courseId,
        event.title,
        event.description,
        event.content,
        event.dueDate,
        event.length,
        event.complexity,
        event.style,
      ),
    );
    response.fold(
      (l) => emit(CourseContentError(l.message, CCActions.createAiReading)),
      (r) => emit(CourseContentAiReadingCreated(r)),
    );
  }

  void _onGetAllActivities(
    EventGetAllActivities event,
    Emitter<CourseContentState> emit,
  ) async {
    emit(CourseContentLoading(CCActions.getAllActivities));
    final response = await useCaseGetAllActivities(
      GetAllActivitiesParams(event.courseId),
    );
    response.fold(
      (l) => emit(CourseContentError(l.message, CCActions.getAllActivities)),
      (r) => emit(CourseContentActivitiesLoaded(r)),
    );
  }
}
