import 'package:fpdart/fpdart.dart';

import '../../../../core/common/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/common/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UserSignIn implements Usecase<UserEntity, UserSignInParams> {
  final AuthRepository authRepository;
  UserSignIn(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;
  UserSignInParams({required this.email, required this.password});
}
