enum CourseOptions {
  yourCourses,
  coursesYouTeach,
}

extension CourseOptionExtension on CourseOptions {
  String get label {
    switch (this) {
      case CourseOptions.yourCourses:
        return 'Tus cursos';
      case CourseOptions.coursesYouTeach:
        return 'Cursos que impartes';
    }
  }
}