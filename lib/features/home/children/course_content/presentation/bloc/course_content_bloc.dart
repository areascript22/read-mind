import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../courses/domain/entities/course_entity.dart';

part 'course_content_event.dart';
part 'course_content_state.dart';

class CourseContentBloc extends Bloc<CourseContentEvent, CourseContentState> {
  CourseContentBloc() : super(CourseContentInitial()) {
    on<CourseContentEvent>((event, emit) => emit(CourseContentLoading()));
    on<LoadCourseEvent>(_onLoadCourse);
  }

  void _onLoadCourse(LoadCourseEvent event, Emitter<CourseContentState> emit){

  }

}
