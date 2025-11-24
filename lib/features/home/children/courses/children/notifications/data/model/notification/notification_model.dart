import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entity/notification_entity.dart';
import '../../../domain/entity/notification_type_entity.dart';
part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required int userId,
    required int typeId,
    required String title,
    required String message,
    required Map<String, dynamic> data,
    required bool read,
    required DateTime sentAt,
    DateTime? readAt,
    DateTime? expiresAt,
    required String deliveryStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
    required NotificationTypeModel type,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
abstract class NotificationTypeModel with _$NotificationTypeModel {
  const factory NotificationTypeModel({
    required int id,
    required String name,
    required String description,
    required String template,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NotificationTypeModel;

  factory NotificationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationTypeModelFromJson(json);
}

extension NotificationModelMapper on NotificationModel {
  NotificationEntity toEntity() => NotificationEntity(
    id: id,
    userId: userId,
    typeId: typeId,
    title: title,
    message: message,
    data: data,
    read: read,
    sentAt: sentAt,
    readAt: readAt,
    expiresAt: expiresAt,
    deliveryStatus: deliveryStatus,
    createdAt: createdAt,
    updatedAt: updatedAt,
    type: type.toEntity(),
  );
}

extension NotificationTypeModelMapper on NotificationTypeModel {
  NotificationTypeEntity toEntity() => NotificationTypeEntity(
    id: id,
    name: name,
    description: description,
    template: template,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
