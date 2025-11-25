class NotificationTypeEntity {
  final int id;
  final String name;
  final String description;
  final String template;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationTypeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.template,
    required this.createdAt,
    required this.updatedAt,
  });
}
