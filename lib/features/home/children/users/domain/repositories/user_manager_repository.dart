import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../../core/error/failure.dart';

abstract interface class UserManagerRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers({
    required int page,
    required int limit,
    required String? role,
  });

  Future<Either<Failure, List<UserEntity>>> searchUsers({
    required String query,
    String? role,
  });

  Future<Either<Failure, UserEntity>> updateUserRole({
    required String targetUserId,
    required String newRole,
  });
}
