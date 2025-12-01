// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreferencesModel _$PreferencesModelFromJson(Map<String, dynamic> json) =>
    _PreferencesModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      seenNotificationDialog: json['seenNotificationDialog'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PreferencesModelToJson(_PreferencesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'seenNotificationDialog': instance.seenNotificationDialog,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
