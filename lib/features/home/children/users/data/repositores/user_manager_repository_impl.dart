import 'dart:convert';

import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/auth/data/models/user_model/user_model.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/src/either.dart';
import 'package:http/http.dart' as http;
import '../../../../../../core/constants/environment.dart';
import '../../../../../../core/error/server_exception.dart';
import '../../domain/repositories/user_manager_repository.dart';

class UserManagerRepositoryImpl implements UserManagerRepository {
  final AuthLocalDataSource authLocalDataSource;

  const UserManagerRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers({
    required int page,
    required int limit,
    required String? role,
  }) async {
    // Build query parameters dynamically
    final queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
      if (role != null) 'role': role, // only include role if not null
    };

    final url = Uri.parse(
      "${Environments.baseUrl}/user/all",
    ).replace(queryParameters: queryParams);
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
        throw ServerException(data['message']);
      }

      final userModels =
          (data['data'] as List)
              .map((e) => UserModel.fromJson(e).toEntity())
              .toList();

      return Right(userModels);
    } catch (e) {
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo obtener los usuarios"));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> searchUsers({
    required String query,
    String? role,
  }) async {
    final queryParams = {
      'query': query,
      if (role != null && role.isNotEmpty)
        'roles': role, // El backend espera "roles"
    };

    final url = Uri.parse(
      "${Environments.baseUrl}/user/search",
    ).replace(queryParameters: queryParams);

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
        throw ServerException(data['message']);
      }

      final userModels =
          (data['data'] as List)
              .map((e) => UserModel.fromJson(e).toEntity())
              .toList();

      return Right(userModels);
    } catch (e) {
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo buscar usuarios"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserRole({
    required String targetUserId,
    required String newRole,
  }) async {
    print("Sending this data: $targetUserId, $newRole");
    final url = Uri.parse("${Environments.baseUrl}/roleRequests/updateRole");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.put(
        url.replace(queryParameters: {'newRole': newRole}),
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({'targetUserId': targetUserId}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al actualizar rol");
      }

      final updatedUser = UserModel.fromJson(data['updatedUser']).toEntity();
      return Right(updatedUser);
    } catch (e) {
      print("Error updating usre role: ${e}");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo actualizar el rol del usuario"));
    }
  }
}
