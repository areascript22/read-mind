import 'notification_type_entity.dart';

class NotificationEntity {
  final int id;
  final int userId;
  final int typeId;
  final String title;
  final String message;
  final Map<String, dynamic> data;
  final bool read;
  final DateTime sentAt;
  final DateTime? readAt;
  final DateTime? expiresAt;
  final String deliveryStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final NotificationTypeEntity type;

  NotificationEntity({
    required this.id,
    required this.userId,
    required this.typeId,
    required this.title,
    required this.message,
    required this.data,
    required this.read,
    required this.sentAt,
    this.readAt,
    this.expiresAt,
    required this.deliveryStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });
}
