import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/entities/user_entity.dart';
import '../role_model/role_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String lastName,
    required String email,
    required String passwordHash,
    required RoleModel role,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
    id: id,
    name: name,
    lastName: lastName,
    email: email,
    passwordHash: passwordHash,
    role: role.toEntity(),
    createdAt: createdAt,
  );
}
