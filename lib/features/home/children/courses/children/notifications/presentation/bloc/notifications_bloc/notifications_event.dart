part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsEvent {}

final class NotificationGetAll extends NotificationsEvent {}

final class NotificationMarkAsRead extends NotificationsEvent {
  final int notificationId;

  NotificationMarkAsRead({required this.notificationId});
}

final class NotificationMarkAllAsRead extends NotificationsEvent {}

final class NotificationGetUnreadCount extends NotificationsEvent {}

final class NotificationInitSocket extends NotificationsEvent {
  final int userId;

  NotificationInitSocket({required this.userId});
}

final class NotificationCloseConnection extends NotificationsEvent {}
