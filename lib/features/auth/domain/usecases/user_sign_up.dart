import 'package:fpdart/fpdart.dart';

import '../../../../core/common/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/common/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UserSignUp implements Usecase<UserEntity, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
      lastName: params.lastName,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  final String lastName;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
  });
}
