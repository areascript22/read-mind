import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

// abstract class NotificationEntity {
//   int get id;
//   int get userId;
//   int get typeId;
//   String get title;
//   String get message;
//   Map<String, dynamic> get data;
//   bool get read;
//   DateTime get sentAt;
//   DateTime? get readAt;
//   DateTime? get expiresAt;
//   String get deliveryStatus;
//   DateTime get createdAt;
//   DateTime get updatedAt;
//   NotificationTypeEntity get type;
// }
//
// abstract class NotificationTypeEntity {
//   int get id;
//   String get name;
//   String get description;
//   String get template;
//   DateTime get createdAt;
//   DateTime get updatedAt;
// }

// =============================================================
// ===============      FREEZED MODELS      ====================
// =============================================================

@freezed
class NotificationModel with _$NotificationModel {
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
class NotificationTypeModel with _$NotificationTypeModel {
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

// =============================================================
// ===============      EXTENSIONS TO ENTITY  ==================
// =============================================================

// extension NotificationModelMapper on NotificationModel {
//   NotificationEntity toEntity() => _NotificationEntityImpl(
//     id: id,
//     userId: userId,
//     typeId: typeId,
//     title: title,
//     message: message,
//     data: data,
//     read: read,
//     sentAt: sentAt,
//     readAt: readAt,
//     expiresAt: expiresAt,
//     deliveryStatus: deliveryStatus,
//     createdAt: createdAt,
//     updatedAt: updatedAt,
//     type: type.toEntity(),
//   );
// }
//
// extension NotificationTypeModelMapper on NotificationTypeModel {
//   NotificationTypeEntity toEntity() => _NotificationTypeEntityImpl(
//     id: id,
//     name: name,
//     description: description,
//     template: template,
//     createdAt: createdAt,
//     updatedAt: updatedAt,
//   );
// }
