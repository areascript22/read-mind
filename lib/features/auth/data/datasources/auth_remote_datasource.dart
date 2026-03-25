import 'package:client_app/features/auth/data/models/auth_response.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/server_exception.dart';
import '../models/user_model/user_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
  });

  Future<AuthResponse> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<AuthResponse> getCurrentUser({required String jwt});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final Dio _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<AuthResponse> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        "/auth/sign_in",
        data: {
          "email": email,
          "password": password,
        },
      );

      final data = response.data;
      return AuthResponse(
        userModel: UserModel.fromJson(data['user']),
        token: data['token'],
      );
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
  }) async {
    try {

      final response = await _dioClient.post(
        "/auth/sign_up",
        data: {
          "email": email,
          "password": password,
          "name": name,
          "lastName": lastName,
        },
      );

      final data = response.data;
      return AuthResponse(
        userModel: UserModel.fromJson(data['user']),
        token: data['token'],
      );
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AuthResponse> getCurrentUser({required String jwt}) async {
    try {
      final response = await _dioClient.get(
        '/auth/renew',
        options: Options(
          headers: {'x-token': jwt},
        ),
      );

      final data = response.data;
      return AuthResponse(
        userModel: UserModel.fromJson(data['user']),
        token: data['token'],
      );
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
