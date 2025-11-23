import 'dart:convert';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/auth/data/models/user_model/user_model.dart';
import 'package:client_app/features/auth/domain/repositories/initial_values_repository.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/app_environment.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_exception.dart';

class InitialValuesRepositoryImpl implements InitialValuesRepository {
  final AuthLocalDataSource authLocalDataSource;

  InitialValuesRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, int>> getCurrentAppBuildNumber() async {
    try {
      final url = Uri.parse("${AppEnvironment().baseUrl}/app/version");
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final buildNumber = data['buildNumber'] as int;
      return right(buildNumber);
    } catch (e) {
      return left(Failure("Build number not available"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateFCMToken({
    required String fcmToken,
  }) async {
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final url = Uri.parse("${AppEnvironment().baseUrl}/notify/fcm/update");
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({"fcmToken": fcmToken}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final userModel = UserModel.fromJson(data['user']);
      return right(userModel.toEntity());
    } catch (e) {
      debugPrint("Error updating FCM Token: $e");
      return left(Failure("Could not update FCM"));
    }
  }
}
