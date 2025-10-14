import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/datasources/coursecontent_remote_datasource.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/repositories/coursecontent_repository_impl.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_create_ai_reading.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_generate_paragraph.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_getall_activitiies.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_getall_students.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/cubit/course_cubit.dart';
import 'package:client_app/features/home/children/courses/data/datasources/courses_remote_datasource.dart';
import 'package:client_app/features/home/children/courses/data/repository/courses_repository_impl.dart';
import 'package:client_app/features/home/children/courses/domain/repository/courses_repositories.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_create_new.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/courses_get_all_enrolled.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_enroll_course.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_remove_course.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_unenroll_course.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_update_courseinfo.dart';
import 'package:client_app/features/home/children/courses/domain/usecases/usecase_update_invitecode.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/course_share_invitecode/share_invitecode_cubit.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/features/home/children/courses/presentation/services/share_service.dart';
import 'package:client_app/features/home/children/users/data/repositores/user_manager_repository_impl.dart';
import 'package:client_app/features/home/children/users/domain/repositories/user_manager_repository.dart';
import 'package:client_app/features/home/children/users/presentation/bloc/user_manager_bloc.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:client_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:client_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:client_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:client_app/features/auth/domain/usecases/current_user.dart';
import 'package:client_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:client_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/children/courses/children/course_content/presentation/bloc/course_content_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await _initSharedPreferences();
  _initAuth();
  _initCourses();
  _initCourseContent();
  _initUserManger();

  serviceLocator.registerLazySingleton(
    () => AppUserCubit(authLocalDataSource: serviceLocator()),
  );
}

Future<void> _initSharedPreferences() async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPrefs);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDataSourceImpl(),
  );
  serviceLocator.registerFactory<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(serviceLocator<SharedPreferences>()),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => CurrentUser(serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
}

void _initCourses() {
  //Repositories
  serviceLocator.registerFactory<CoursesRemoteDatasource>(
    () => CoursesRemoteDatasourceImpl(),
  );
  serviceLocator.registerFactory<CoursesRepository>(
    () => CoursesRepositoryImpl(serviceLocator(), serviceLocator()),
  );

  //UseCases
  serviceLocator.registerFactory(() => GetAllCourses(serviceLocator()));
  serviceLocator.registerFactory(
    () => CoursesCreateNewUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetAllEnrolledCourses(serviceLocator()));
  serviceLocator.registerFactory(() => UseCaseRemoveCourse(serviceLocator()));
  serviceLocator.registerFactory(
    () => UseCaseUpdateInviteCode(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UseCaseUpdateCourseInfo(serviceLocator()),
  );

  serviceLocator.registerFactory(() => UseCaseEnrollCourse(serviceLocator()));
  serviceLocator.registerFactory(() => UseCaseUnEnrollCourse(serviceLocator()));

  //Services
  serviceLocator.registerFactory<ShareService>(() => ShareServiceImpl());

  serviceLocator.registerLazySingleton(
    () => ShareInvitecodeCubit(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => CoursesBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
}

void _initCourseContent() {
  //Repositories
  serviceLocator.registerFactory<CourseContentRemoteDataSource>(
    () => CourseContentRemoteDataSourceImpl(),
  );

  serviceLocator.registerFactory<CourseContentRepository>(
    () => CourseContentRepositoryImpl(serviceLocator(), serviceLocator()),
  );
  //UseCases
  serviceLocator.registerFactory(() => UseCaseGetAllStudents(serviceLocator()));
  serviceLocator.registerFactory(
    () => UseCaseGenerateParagraph(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UseCaseCreateAIReading(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UseCaseGetAllActivities(serviceLocator()),
  );
  //Boc/Cubit
  serviceLocator.registerLazySingleton(() => CourseCubit());

  serviceLocator.registerLazySingleton(
    () => CourseContentBloc(
      useCaseGetAllStudents: serviceLocator(),
      useCaseGenerateParagraph: serviceLocator(),
      useCaseCreateAIReading: serviceLocator(),
      useCaseGetAllActivities: serviceLocator(),
    ),
  );
}

void _initUserManger() {
  serviceLocator.registerFactory<UserManagerRepository>(
    () => UserManagerRepositoryImpl(authLocalDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => UserManagerBloc(userManagerRepository: serviceLocator()),
  );
}
