import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/pages/auth_wrapper.dart';
import 'package:client_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:client_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:client_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/bloc/ai_reading_bloc/ai_reading_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/ai_reading_activity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/main_idea_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/paraphrase_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/pages/summary_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/paragraph_metadata.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/activity_progress/activity_progress_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/students/students_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/cubit/course_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/pages/create_ai_reading_page.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/pages/generate_paragraph.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/pages/update_course_info_page.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/student_tracking.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/student_tracking_info_entity.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/course_option_cubit/course_option_cubit.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/course_share_invitecode/share_invitecode_cubit.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/features/home/children/courses/presentation/pages/create_course.dart';
import 'package:client_app/features/home/children/courses/presentation/pages/enroll_course.dart';
import 'package:client_app/features/home/presentation/pages/home_page.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/children/courses/children/course_content/presentation/bloc/course_content/course_content_bloc.dart';
import '../../features/home/children/courses/children/course_content/presentation/pages/course_settings.dart';
import '../../features/home/children/courses/children/course_content/presentation/pages/pages_container.dart';

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
              BlocProvider.value(value: serviceLocator<CoursesBloc>()),
              BlocProvider(create: (context) => CourseOptionCubit()),
              BlocProvider(
                create: (context) => serviceLocator<ShareInvitecodeCubit>(),
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
            builder: (context, state) {
              return EnrollCourse();
            },
          ),
        ],
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: serviceLocator<CourseContentBloc>()),
              BlocProvider.value(value: serviceLocator<ActivityProgressBloc>()),
              BlocProvider.value(value: serviceLocator<CoursesBloc>()),
              BlocProvider.value(value: serviceLocator<ShareInvitecodeCubit>()),
              BlocProvider.value(value: serviceLocator<CourseCubit>()),
              BlocProvider.value(value: serviceLocator<StudentsBloc>()),
              BlocProvider.value(value: serviceLocator<AiReadingBloc>()),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "${RouteNames.courseContent}/:id",
            builder: (context, state) {
              // final courseId = state.pathParameters['id'] ?? '';
              final courseEntity = state.extra as CourseEntity;
              // context.read<CourseContentBloc>().add(LoadCourseEvent(courseId));
              return PagesContainer(courseEntity: courseEntity);
            },
          ),
          GoRoute(
            path: RouteNames.courseSettings,
            builder: (context, state) {
              final courseEntity = state.extra as CourseEntity;
              return CourseSettings(courseEntity: courseEntity);
            },
          ),

          GoRoute(
            path: RouteNames.courseUpdateInfo,
            builder: (context, state) {
              final courseEntity = state.extra as CourseEntity;
              return UpdateCourseInfoPage(courseEntity: courseEntity);
            },
          ),

          GoRoute(
            path: RouteNames.courseContentGenerateParagraph,
            builder: (context, state) {
              return GenerateParagraphPage();
            },
          ),

          GoRoute(
            path: RouteNames.courseContentCreateAiReading,
            builder: (context, state) {
              final content = state.extra as ParagraphMetadata;
              return CreateAiReadingPage(paragraphMetadata: content);
            },
          ),

          GoRoute(
            path: RouteNames.activityAIReading,
            builder: (context, state) {
              final activityModel = state.extra as ActivityModel;
              return AiReadingActivity(activityModel: activityModel);
            },
          ),

          GoRoute(
            path: RouteNames.activityParaphrase,
            builder: (context, state) {
              final originalParagraph = state.extra as String;
              return ParaphrasePage(originalParagraph: originalParagraph);
            },
          ),

          GoRoute(
            path: RouteNames.activitySummary,
            builder: (context, state) {
              final originalParagraph = state.extra as String;
              return SummaryPage(originalParagraph: originalParagraph);
            },
          ),

          GoRoute(
            path: RouteNames.activityMainIdea,
            builder: (context, state) {
              final originalParagraph = state.extra as String;
              return MainIdeaPage(originalParagraph: originalParagraph);
            },
          ),
        ],
      ),

      GoRoute(
        path: RouteNames.studentTracking,
        builder: (context, state) {
          final student = state.extra as StudentTrackingInfoEntity;
          return StudentTrackingPage(info: student);
        },
      ),
    ],
  );
}
