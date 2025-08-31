import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/common/entities/role_entity.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
abstract class RoleModel with _$RoleModel {
  const factory RoleModel({
    required int id,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}

extension RoleModelX on RoleModel {
  RoleEntity toEntity() => RoleEntity(
    id: id,
    name: name,
    description: description,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
