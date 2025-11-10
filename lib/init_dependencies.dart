import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/datasource/local_datasource/local_reading_progress_datasource%20.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/repository/ai_reading_local_impl.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/repository/ai_reading_repository_impl.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_local_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/bloc/ai_reading_bloc/ai_reading_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/cubit/ai_reading_progress_cubit/ai_reading_progress_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/cubit/translation_cubit/translation_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/datasources/coursecontent_remote_datasource.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/repositories/activity_progress_repository_impl.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/repositories/coursecontent_repository_impl.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/activity_progress_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/course_content_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_create_ai_reading.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_generate_paragraph.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_get_user.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_getall_activitiies.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/usecases/usecase_getall_students.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/activity_progress/activity_progress_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/students/students_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/cubit/course_cubit.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/repository/progress_repository_impl.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/repository/progress_repository.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/bloc/progress_bloc/progress_bloc.dart';
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
import 'package:client_app/features/home/children/profile/data/repository/profile_repository_impl.dart';
import 'package:client_app/features/home/children/profile/domain/repository/profile_repository.dart';
import 'package:client_app/features/home/children/profile/presentation/bloc/profile_bloc.dart';
import 'package:client_app/features/home/children/users/data/repositores/user_manager_repository_impl.dart';
import 'package:client_app/features/home/children/users/domain/repositories/user_manager_repository.dart';
import 'package:client_app/features/home/children/users/presentation/bloc/user_manager_bloc.dart';
import 'package:client_app/features/home/children/vocabulary/data/repository/vocabulary_repository_impl.dart';
import 'package:client_app/features/home/children/vocabulary/domain/repository/vocabulary_repository.dart';
import 'package:client_app/features/home/children/vocabulary/presentation/bloc/vocabulary_bloc/vocabulary_bloc.dart';
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

import 'features/home/children/courses/children/course_content/presentation/bloc/course_content/course_content_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await _initSharedPreferences();
  _initAuth();
  _initCourses();
  _initCourseContent();
  _initUserManger();
  _initProfile();
  _initCourseActivities();
  _initVocabulary();
  _initActivityProgress();

  serviceLocator.registerLazySingleton(
    () => AppUserCubit(authLocalDataSource: serviceLocator()),
  );
}

Future<void> _initSharedPreferences() async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPrefs);
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

  serviceLocator.registerFactory(() => UseCaseGetUser(serviceLocator()));
  //Boc/Cubit
  serviceLocator.registerLazySingleton(() => CourseCubit());

  serviceLocator.registerLazySingleton(
    () => CourseContentBloc(
      useCaseGetAllStudents: serviceLocator(),
      useCaseGenerateParagraph: serviceLocator(),
      useCaseCreateAIReading: serviceLocator(),
      useCaseGetAllActivities: serviceLocator(),
      useCaseGetUser: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => StudentsBloc(courseContentRepository: serviceLocator()),
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

void _initProfile() {
  serviceLocator.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => ProfileBloc(profileRepository: serviceLocator()),
  );
}

void _initCourseActivities() {
  serviceLocator.registerFactory<AiReadingRepository>(
    () => AiReadingRepositoryImpl(
      authLocalDataSource: serviceLocator(),
      aiReadingProgress: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AiReadingBloc(aiReadingRepository: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => TranslationCubit(aiReadingRepository: serviceLocator()),
  );
}

void _initVocabulary() {
  serviceLocator.registerFactory<VocabularyRepository>(
    () => VocabularyRepositoryImpl(authLocalDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => VocabularyBloc(vocabularyRepository: serviceLocator()),
  );
}

void _initActivityProgress() {
  serviceLocator.registerFactory(
    () => LocalReadingProgressDataSource(sharedPreferences: serviceLocator()),
  );

  serviceLocator.registerFactory<ProgressRepository>(
    () => ProgressRepositoryImpl(authLocalDataSource: serviceLocator()),
  );

  serviceLocator.registerFactory<ActivityProgressRepository>(
    () => ActivityProgressRepositoryImpl(authLocalDataSource: serviceLocator()),
  );

  serviceLocator.registerFactory<AiReadingLocalRepository>(
    () => AiReadingLocalRepositoryImpl(
      localReadingProgressDatasource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ProgressBloc(progressRepository: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => ActivityProgressBloc(activityProgressRepository: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => AiReadingProgressCubit(aiReadingLocalRepository: serviceLocator()),
  );
}
