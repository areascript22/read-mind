class NotificationTypeEntity {
  final int id;
  final String name;
  final String description;
  final String titleTemplate;
  final String bodyTemplate;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationTypeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.titleTemplate,
    required this.bodyTemplate,
    required this.createdAt,
    required this.updatedAt,
  });
}
