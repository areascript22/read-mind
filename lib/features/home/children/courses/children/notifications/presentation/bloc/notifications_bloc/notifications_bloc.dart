import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/notification_entity.dart';
import '../../../domain/repository/notifications_history_repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsHistoryRepository notificationsHistoryRepository;

  NotificationsBloc({required this.notificationsHistoryRepository})
    : super(NotificationsInitial()) {
    on<NotificationGetAll>(_getAllNotifications);
    on<NotificationMarkAsRead>(_markAsReadNotify);
    on<NotificationMarkAllAsRead>(_markAllAsReadNotify);
    on<NotificationGetUnreadCount>(_getUnreadCount);
    on<NotificationInitSocket>(_initSocket);
    on<NotificationCloseConnection>(_closeConnection);
  }

  void _closeConnection(
    NotificationCloseConnection event,
    Emitter<NotificationsState> emit,
  ) {
    notificationsHistoryRepository.disconnectSocket();
  }

  void _initSocket(
    NotificationInitSocket event,
    Emitter<NotificationsState> emit,
  ) {
    notificationsHistoryRepository.connectSocket(
      event.userId,
      _onNewNotificationCallback,
    );
  }

  void _onNewNotificationCallback() {
    add(NotificationGetUnreadCount());
  }

  void _getAllNotifications(
    NotificationGetAll event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(UserNotificationsLoading(notifyActions: UserNotifyActions.getAll));
    final response =
        await notificationsHistoryRepository.getUserNotifications();
    response.fold(
      (l) => emit(
        UserNotificationsError(
          notifyActions: UserNotifyActions.getAll,
          message: l.message,
        ),
      ),
      (r) => emit(UserNotificationsAllLoaded(notificationsEntity: r)),
    );
  }

  void _markAsReadNotify(
    NotificationMarkAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(UserNotificationsLoading(notifyActions: UserNotifyActions.markAsRead));
    final response = await notificationsHistoryRepository.markAsRead(
      notificationId: event.notificationId,
    );
    response.fold(
      (l) => emit(
        UserNotificationsError(
          notifyActions: UserNotifyActions.markAsRead,
          message: l.message,
        ),
      ),
      (r) => emit(UserNotificationsMarkedAsRead(notificationEntity: r)),
    );
  }

  void _markAllAsReadNotify(
    NotificationMarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      UserNotificationsLoading(notifyActions: UserNotifyActions.markAllAsRead),
    );
    final response = await notificationsHistoryRepository.markAllAsRead();
    response.fold(
      (l) => emit(
        UserNotificationsError(
          notifyActions: UserNotifyActions.markAllAsRead,
          message: l.message,
        ),
      ),
      (r) => emit(UserNotifyAllMarkedAsRead(message: r)),
    );
  }

  void _getUnreadCount(
    NotificationGetUnreadCount event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      UserNotificationsLoading(notifyActions: UserNotifyActions.getUnreadCount),
    );
    final response = await notificationsHistoryRepository.getUnreadCount();
    response.fold(
      (l) => emit(
        UserNotificationsError(
          notifyActions: UserNotifyActions.getUnreadCount,
          message: l.message,
        ),
      ),
      (r) => emit(UserNotifyUnreadCountLoaded(count: r)),
    );
  }
}
