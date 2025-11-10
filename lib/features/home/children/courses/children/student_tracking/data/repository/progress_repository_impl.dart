import 'dart:convert';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/statistics/statistics_model.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/tracking_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/repository/progress_repository.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../../core/constants/app_environment.dart';
import '../../../../../../../../core/error/server_exception.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final AuthLocalDataSource authLocalDataSource;

  ProgressRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, TrackingEntity>> getStudentTrackData({
    required int userId,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/progress/$userId");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(
          data['message'] ?? "Error al obtener el progreso del estudiante",
        );
      }

      final progresses =
          (data['data']['progresses'] as List)
              .map((e) => ProgressModel.fromJson(e).toEntity())
              .toList();
      final statistics =
          StatisticsModel.fromJson(data['data']['statistics']).toEntity();

      return Right(
        TrackingEntity(progresses: progresses, statistics: statistics),
      );
    } catch (e) {
      debugPrint("Error getting student progress $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo obtener el progreso del estudiante"));
    }
  }
}
