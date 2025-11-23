import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domian/entity/preferences_entitty.dart';

part 'preferences_model.freezed.dart';
part 'preferences_model.g.dart';

@freezed
abstract class PreferencesModel with _$PreferencesModel {
  const factory PreferencesModel({
    required int id,
    required int userId,
    required bool seenNotificationDialog,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PreferencesModel;

  factory PreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$PreferencesModelFromJson(json);
}

extension PreferencesModelMapper on PreferencesModel {
  PreferencesEntity toEntity() {
    return PreferencesEntity(
      id: id,
      userId: userId,
      seenNotificationDialog: seenNotificationDialog,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
