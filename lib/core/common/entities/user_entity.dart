import 'package:client_app/core/common/entities/role_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String passwordHash;
  final RoleEntity role;
  final DateTime createdAt;
  final bool emailVerified;

  const UserEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.passwordHash,
    required this.role,
    required this.createdAt,
    required this.emailVerified,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    lastName,
    email,
    passwordHash,
    role,
    createdAt,
    emailVerified,
  ];
}
