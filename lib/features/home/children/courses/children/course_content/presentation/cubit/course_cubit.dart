import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/course_entity.dart';

class CourseCubit extends Cubit<CourseEntity?> {
  CourseCubit() : super(null);

  void setCourse(CourseEntity course) => emit(course);

  void clearCourse() => emit(null);
}
