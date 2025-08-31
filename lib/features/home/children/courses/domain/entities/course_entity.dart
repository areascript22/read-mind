import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String inviteCode;
  final int teacherId;
  final DateTime createdAt;

  const CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.inviteCode,
    required this.teacherId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    inviteCode,
    teacherId,
    createdAt,
  ];
}
