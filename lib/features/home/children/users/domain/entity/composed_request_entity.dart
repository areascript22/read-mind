import 'package:client_app/core/common/entities/role_entity.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/profile/domain/entity/role_request_entity.dart';

class ComposedRequestEntity {
  final RoleRequestEntity roleRequestEntity;
  final UserEntity userEntity;
  final RoleEntity roleEntity;

  ComposedRequestEntity({
    required this.roleRequestEntity,
    required this.userEntity,
    required this.roleEntity,
  });
}
