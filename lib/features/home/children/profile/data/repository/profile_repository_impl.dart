import 'dart:convert';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/profile/data/model/role_request/role_request_models.dart';
import 'package:client_app/features/home/children/profile/domain/entity/role_request_entity.dart';
import 'package:client_app/features/home/children/profile/domain/repository/profile_repository.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../core/constants/app_environment.dart';
import '../../../../../../core/error/server_exception.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AuthLocalDataSource authLocalDataSource;
  const ProfileRepositoryImpl(this.authLocalDataSource);

  @override
  Future<Either<Failure, RoleRequestEntity>> requestRole({
    required int requestedRole,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/roleRequests/askForRole/$requestedRole",
    );
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }

      final roleRequestModel = RoleRequestResponse.fromJson(
        data['roleRequest'],
      );

      return Right(roleRequestModel.roleRequest.toEntity());
    } catch (e) {
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo realizar la peticion"));
    }
  }
}
