import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/profile/domain/entity/role_request_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, RoleRequestEntity>> requestRole({
    required int requestedRole,
  });
}
