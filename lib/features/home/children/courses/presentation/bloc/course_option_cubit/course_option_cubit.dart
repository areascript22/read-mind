import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/domain/enums/course_option.dart';
import 'package:meta/meta.dart';

part 'course_option_state.dart';

class CourseOptionCubit extends Cubit<CourseOptions> {
  CourseOptionCubit() : super(CourseOptions.yourCourses);

  void selectOption(CourseOptions opt) => emit(opt);
}
