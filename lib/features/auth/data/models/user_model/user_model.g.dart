// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  passwordHash: json['passwordHash'] as String,
  role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'passwordHash': instance.passwordHash,
      'role': instance.role,
      'createdAt': instance.createdAt.toIso8601String(),
    };
