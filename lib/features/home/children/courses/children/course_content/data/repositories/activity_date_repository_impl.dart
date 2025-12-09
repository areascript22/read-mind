import 'dart:convert';

import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/repositories/activity_date_repository.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../core/constants/app_environment.dart';
import '../../../../../../../../core/error/server_exception.dart';

class ActivityDateRepositoryImpl implements ActivityDateRepository {
  final AuthLocalDataSource authLocalDataSource;

  ActivityDateRepositoryImpl({required this.authLocalDataSource});
  @override
  Future<Either<Failure, bool>> isActivityOverdue({
    required int activityId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/$activityId/overdue",
    );

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
        throw ServerException(data['message'] ?? "Error al consultar fecha");
      }

      final overdue = data['isOverdue'];

      return Right(overdue);
    } catch (e) {
      debugPrint("Error al consultar fecha: $e");
      if (e is ServerException) {
        debugPrint("Error al consultar fecha: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("Error al consultar fecha"));
    }
  }
}
