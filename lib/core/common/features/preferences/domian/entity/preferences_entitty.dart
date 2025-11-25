class PreferencesEntity {
  final int id;
  final int userId;
  final bool seenNotificationDialog;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PreferencesEntity({
    required this.id,
    required this.userId,
    required this.seenNotificationDialog,
    required this.createdAt,
    required this.updatedAt,
  });
}
