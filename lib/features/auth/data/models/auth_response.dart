import 'package:client_app/features/auth/data/models/user_model/user_model.dart';

class AuthResponse {
  final UserModel userModel;
  final String token;

  const AuthResponse({required this.userModel, required this.token});
}
