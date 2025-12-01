import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/notification_entity.dart';
import '../../../domain/repository/notifications_history_repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsHistoryRepository notificationsHistoryRepository;

  NotificationsBloc({required this.notificationsHistoryRepository})
    : super(NotificationsState.initial()) {
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
    emit(state.copyWith(isLoadingList: true, errorMessageGetAll: null));
    final response =
        await notificationsHistoryRepository.getUserNotifications();
    response.fold(
      (l) => emit(
        state.copyWith(
          isLoadingList: false,
          errorMessageGetAll: l.message,
          notificationsLoaded: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isLoadingList: false,
          errorMessageGetAll: null,
          notifications: r,
          notificationsLoaded: true,
        ),
      ),
    );
  }

  void _markAsReadNotify(
    NotificationMarkAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(isMarkingAsRead: true, errorMessageMarkAsRead: null));
    final response = await notificationsHistoryRepository.markAsRead(
      notificationId: event.notificationId,
    );
    response.fold(
      (l) => emit(
        state.copyWith(
          isMarkingAsRead: false,
          errorMessageMarkAsRead: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isMarkingAsRead: false,
          errorMessageMarkAsRead: null,
          markedAsRead: r,
        ),
      ),
    );
  }

  void _markAllAsReadNotify(
    NotificationMarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(isMarkingAllAsRead: true, errorMessageMarkAllAsRead: null),
    );
    final response = await notificationsHistoryRepository.markAllAsRead();
    response.fold(
      (l) => emit(
        state.copyWith(
          isMarkingAllAsRead: false,
          errorMessageMarkAllAsRead: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isMarkingAllAsRead: false,
          errorMessageMarkAllAsRead: null,
          markedAllAsRead: true,
        ),
      ),
    );
  }

  void _getUnreadCount(
    NotificationGetUnreadCount event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(isLoadingCount: true, errorMessageUnreadCount: null));
    final response = await notificationsHistoryRepository.getUnreadCount();
    response.fold(
      (l) => emit(
        state.copyWith(
          isLoadingCount: false,
          errorMessageUnreadCount: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          isLoadingCount: false,
          errorMessageUnreadCount: null,
          unreadCount: r,
        ),
      ),
    );
  }
}
