import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/usecase/usecase.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements Usecase<UserEntity, Noparams>{
  final AuthRepository authRepository;
  const CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(Noparams params)async {
    return await authRepository.getCurrentUser();
  }

}

class Noparams{

}