import 'dart:convert';

import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/activity_progress_repository.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../core/constants/app_environment.dart';
import '../../../../../../../../core/error/failure.dart';
import '../../../../../../../../core/error/server_exception.dart';
import '../../../student_tracking/data/model/progress/progress_model.dart';
import '../../../student_tracking/domian/entity/progress_entity.dart';

class ActivityProgressRepositoryImpl implements ActivityProgressRepository {
  final AuthLocalDataSource authLocalDataSource;

  ActivityProgressRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, ProgressEntity>> createInitialActivityProgress({
    required int aiReadingId,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/progress/$aiReadingId");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "completed": false,
          "totalProgress": 25,
          "totalScore": 10,
          "readingCompleted": false,
          "paraphraseCompleted": false,
          "mainIdeaCompleted": false,
          "summaryCompleted": false,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al crear recurso");
      }

      final progressModel = ProgressModel.fromJson(data['data']);

      return Right(progressModel.toEntity());
    } catch (e) {
      debugPrint("Error creating initial progress $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo crear el recurso"));
    }
  }

  @override
  Future<Either<Failure, ProgressEntity>> updateActivityProgress({
    required int aiReadingId,
    required Map dataToUpdate,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/progress/$aiReadingId");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode(dataToUpdate),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al actualizar recurso");
      }

      final progressModel = ProgressModel.fromJson(data['data']);

      return Right(progressModel.toEntity());
    } catch (e) {
      debugPrint("Error updating progress $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo actualizar el recurso"));
    }
  }
}
