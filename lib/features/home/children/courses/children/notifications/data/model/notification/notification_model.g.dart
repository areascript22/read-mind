// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(
  Map<String, dynamic> json,
) => _NotificationModel(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  typeId: (json['typeId'] as num).toInt(),
  title: json['title'] as String,
  message: json['message'] as String,
  data: json['data'] as Map<String, dynamic>,
  read: json['read'] as bool,
  sentAt: DateTime.parse(json['sentAt'] as String),
  readAt:
      json['readAt'] == null ? null : DateTime.parse(json['readAt'] as String),
  expiresAt:
      json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
  deliveryStatus: json['deliveryStatus'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  type: NotificationTypeModel.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'typeId': instance.typeId,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
      'read': instance.read,
      'sentAt': instance.sentAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'deliveryStatus': instance.deliveryStatus,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'type': instance.type,
    };

_NotificationTypeModel _$NotificationTypeModelFromJson(
  Map<String, dynamic> json,
) => _NotificationTypeModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  template: json['template'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$NotificationTypeModelToJson(
  _NotificationTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'template': instance.template,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
