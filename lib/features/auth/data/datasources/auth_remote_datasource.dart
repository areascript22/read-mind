import 'dart:convert';
import 'package:client_app/features/auth/data/models/auth_response.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/environment.dart';
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
  @override
  Future<AuthResponse> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse("${Environments.authUrl}/sign_in");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final userModel = UserModel.fromJson(data['user']);
      final token = data['token'];
      return AuthResponse(userModel: userModel, token: token);
    } catch (e) {
      throw ServerException(e is ServerException ? e.message : e.toString());
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
      final url = Uri.parse("${Environments.authUrl}/sign_up");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
          "lastName": lastName,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 201) {
        throw ServerException(data['message']);
      }
      final userJson = data['user'];
      final userModel =  UserModel.fromJson(userJson);
      final token = data['token'];
      return AuthResponse(userModel: userModel, token: token);
    } catch (e) {
      throw ServerException(e is ServerException ? e.message : e.toString());
    }
  }

  @override
  Future<AuthResponse> getCurrentUser({required String jwt}) async {
    try {
      final response = await http.get(
        Uri.parse('${Environments.authUrl}/renew'),
        headers: {'Content-Type': 'application/json', 'x-token': jwt},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final userModel = UserModel.fromJson(data['user']);
      final token = data['token'];
      return AuthResponse(userModel: userModel, token: token);
    } catch (e) {
      throw ServerException(e is ServerException ? e.message : e.toString());
    }
  }
}
