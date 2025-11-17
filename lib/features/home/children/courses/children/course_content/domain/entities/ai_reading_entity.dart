import 'package:equatable/equatable.dart';

class AIReadingEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final int aiReadingId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String length;
  final String complexity;
  final String style;

  const AIReadingEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.aiReadingId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.length,
    required this.complexity,
    required this.style,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    dueDate,
    aiReadingId,
    content,
    createdAt,
    updatedAt,
  ];
}
