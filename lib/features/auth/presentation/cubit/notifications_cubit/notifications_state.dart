part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {
  final NotificationAction notificationAction;

  NotificationsLoading({required this.notificationAction});
}

final class NotificationsTokenUpdated extends NotificationsState {}

final class NotificationsPermitsGranted extends NotificationsState {}

final class NotificationsError extends NotificationsState {
  final String message;
  final NotificationAction notificationAction;

  NotificationsError({required this.message, required this.notificationAction});
}

enum NotificationAction { updateFCM, requestPermissions }
