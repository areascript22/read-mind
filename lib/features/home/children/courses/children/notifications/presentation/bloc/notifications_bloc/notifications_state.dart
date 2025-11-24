part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class UserNotificationsLoading extends NotificationsState {
  final UserNotifyActions notifyActions;

  UserNotificationsLoading({required this.notifyActions});
}

final class UserNotificationsError extends NotificationsState {
  final String message;
  final UserNotifyActions notifyActions;

  UserNotificationsError({required this.notifyActions, required this.message});
}

final class UserNotificationsAllLoaded extends NotificationsState {
  final List<NotificationEntity> notificationsEntity;
  UserNotificationsAllLoaded({required this.notificationsEntity});
}

final class UserNotificationsMarkedAsRead extends NotificationsState {
  final NotificationEntity notificationEntity;

  UserNotificationsMarkedAsRead({required this.notificationEntity});
}

final class UserNotifyAllMarkedAsRead extends NotificationsState {
  final String message;

  UserNotifyAllMarkedAsRead({required this.message});
}

final class UserNotifyUnreadCountLoaded extends NotificationsState {
  final int count;

  UserNotifyUnreadCountLoaded({required this.count});
}

enum UserNotifyActions { getAll, markAsRead, markAllAsRead, getUnreadCount }
