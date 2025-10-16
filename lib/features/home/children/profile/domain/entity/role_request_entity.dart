import 'status_entity.dart';

class RoleRequestEntity {
  final int id;
  final int userId;
  final int requestedRoleId;
  final int statusId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final StatusEntity status;

  const RoleRequestEntity({
    required this.id,
    required this.userId,
    required this.requestedRoleId,
    required this.statusId,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoleRequestEntity &&
        other.id == id &&
        other.userId == userId &&
        other.requestedRoleId == requestedRoleId &&
        other.statusId == statusId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        requestedRoleId.hashCode ^
        statusId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'RoleRequestEntity(id: $id, userId: $userId, requestedRoleId: $requestedRoleId, statusId: $statusId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
  }
}
