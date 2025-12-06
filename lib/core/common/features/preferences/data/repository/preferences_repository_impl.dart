import 'dart:convert';

import 'package:client_app/core/common/features/preferences/data/model/preferences_model/preferences_model.dart';
import 'package:client_app/core/common/features/preferences/domian/entity/preferences_entitty.dart';
import 'package:client_app/core/common/features/preferences/domian/repository/preferences_repository.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../constants/app_environment.dart';
import '../../../../../error/server_exception.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final AuthLocalDataSource authLocalDataSource;

  PreferencesRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, PreferencesEntity>> updateDialogNotificationSeen({
    required int userId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final url = Uri.parse("${AppEnvironment().baseUrl}/preferences");

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }

      final preferencesModel = PreferencesModel.fromJson(data['preferences']);

      return Right(preferencesModel.toEntity());
    } catch (e) {
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure('Preferences not found'));
    }
  }

  @override
  Future<Either<Failure, PreferencesEntity>> getPreferences({
    required int userId,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final url = Uri.parse("${AppEnvironment().baseUrl}/preferences");

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }

      final preferencesModel = PreferencesModel.fromJson(data['preferences']);

      return Right(preferencesModel.toEntity());
    } catch (e) {
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure('Preferences not found'));
    }
  }
}
