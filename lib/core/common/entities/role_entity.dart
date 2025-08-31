import 'package:equatable/equatable.dart';

class RoleEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RoleEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name,description, createdAt, updatedAt];
}