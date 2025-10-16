// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Status _$StatusFromJson(Map<String, dynamic> json) => _Status(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$StatusToJson(_Status instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_RoleRequest _$RoleRequestFromJson(Map<String, dynamic> json) => _RoleRequest(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  requestedRoleId: (json['requestedRoleId'] as num).toInt(),
  statusId: (json['statusId'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  status: Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoleRequestToJson(_RoleRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'requestedRoleId': instance.requestedRoleId,
      'statusId': instance.statusId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': instance.status,
    };

_RoleRequestResponse _$RoleRequestResponseFromJson(Map<String, dynamic> json) =>
    _RoleRequestResponse(
      roleRequest: RoleRequest.fromJson(
        json['roleRequest'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RoleRequestResponseToJson(
  _RoleRequestResponse instance,
) => <String, dynamic>{'roleRequest': instance.roleRequest};
