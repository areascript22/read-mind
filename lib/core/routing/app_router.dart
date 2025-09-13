import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/pages/auth_wrapper.dart';
import 'package:client_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:client_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:client_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:client_app/features/home/children/course_content/presentation/bloc/course_content_bloc.dart';
import 'package:client_app/features/home/children/course_content/presentation/pages/course_settings.dart';
import 'package:client_app/features/home/children/course_content/presentation/pages/pages_container.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/course_option_cubit/course_option_cubit.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/features/home/children/courses/presentation/pages/create_course.dart';
import 'package:client_app/features/home/children/courses/presentation/pages/enroll_course.dart';
import 'package:client_app/features/home/presentation/pages/home_page.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: RouteNames.splashScreen,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: serviceLocator<AuthBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.splashScreen,
            builder: (context, state) => SplashScreen(),
          ),
          GoRoute(
            path: RouteNames.authWrapper,
            builder: (context, state) => AuthWrapper(),
          ),
          GoRoute(
            path: RouteNames.signIn,
            builder: (context, state) => SignInPage(),
          ),
          GoRoute(
            path: RouteNames.signUp,
            builder: (context, state) => SignUpPage(),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: serviceLocator<CoursesBloc>(),
              ),
              BlocProvider(
                create: (context) => CourseOptionCubit(),
              ),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.home,
            builder: (context, state) => HomePage(),
          ),
          GoRoute(
            path: RouteNames.createCourse,
            builder: (context, state) => CreateCoursePage(),
          ),
          GoRoute(
            path: RouteNames.enrollCourse,
            builder: (context, state) => EnrollCourse(),
          ),
        ],
      ),

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: serviceLocator<CourseContentBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "${RouteNames.courseContent}/:id",
            builder: (context, state) {
              final courseId = state.pathParameters['id'] ?? '';
              context.read<CourseContentBloc>().add(LoadCourseEvent(courseId));
              return PagesContainer();
            },
          ),
          GoRoute(
            path: RouteNames.courseSettings,
            builder: (context, state) {
              return CourseSettings();
            },
          ),
        ],
      ),
    ],
  );
}
