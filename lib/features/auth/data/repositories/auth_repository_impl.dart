import 'dart:convert';

import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:client_app/features/auth/data/models/user_model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/app_environment.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/common/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(this.authRemoteDatasource, this.authLocalDataSource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await authRemoteDatasource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      await authLocalDataSource.saveJwt(authResponse.token);
      return right(authResponse.userModel.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
  }) async {
    try {
      final response = await authRemoteDatasource.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
        lastName: lastName,
      );
      await authLocalDataSource.saveJwt(response.token);
      final userModel = response.userModel;
      return right(userModel.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final jwt = await authLocalDataSource.getJwt();
      if (jwt == null) {
        return left(Failure("User is not logged in!!"));
      }
      final authResponse = await authRemoteDatasource.getCurrentUser(jwt: jwt);
      await authLocalDataSource.saveJwt(authResponse.token);
      return right(authResponse.userModel.toEntity());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String email,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/auth/password/forgot");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(
          data['message'] ??
              "Error al generar link de recuperación de contraseña",
        );
      }
      debugPrint("Link: ${data['link']}");
      final message = data['message'];
      return Right(message);
    } catch (e) {
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("Servicio no disponible"));
    }
  }
}
