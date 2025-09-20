import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/data/models/course/course_model.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../../../../core/error/server_exception.dart';
import '../../domain/repositories/course_content_repository.dart';
import '../datasources/coursecontent_remote_datasource.dart';

class CourseContentRepositoryImpl implements CourseContentRepository {
  final CourseContentRemoteDataSource courseContentRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  CourseContentRepositoryImpl(
    this.courseContentRemoteDataSource,
    this.authLocalDataSource,
  );
}
