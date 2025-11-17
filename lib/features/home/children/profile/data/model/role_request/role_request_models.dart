import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/role_request_entity.dart';
import '../../../domain/entity/status_entity.dart';

part 'role_request_models.freezed.dart';
part 'role_request_models.g.dart';

@freezed
abstract class Status with _$Status {
  const factory Status({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
abstract class RoleRequest with _$RoleRequest {
  const factory RoleRequest({
    required int id,
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'requestedRoleId') required int requestedRoleId,
    @JsonKey(name: 'statusId') required int statusId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    required Status status,
  }) = _RoleRequest;

  factory RoleRequest.fromJson(Map<String, dynamic> json) =>
      _$RoleRequestFromJson(json);
}

@freezed
abstract class RoleRequestResponse with _$RoleRequestResponse {
  const factory RoleRequestResponse({required RoleRequest roleRequest}) =
      _RoleRequestResponse;

  factory RoleRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleRequestResponseFromJson(json);
}

extension StatusToEntity on Status {
  StatusEntity toEntity() {
    return StatusEntity(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension RoleRequestToEntity on RoleRequest {
  RoleRequestEntity toEntity() {
    return RoleRequestEntity(
      id: id,
      userId: userId,
      requestedRoleId: requestedRoleId,
      statusId: statusId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status.toEntity(),
    );
  }
}
