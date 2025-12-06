part of 'notifications_bloc.dart';

@immutable
class NotificationsState {
  final List<NotificationEntity> notifications;
  final bool notificationsLoaded;
  final int unreadCount;
  final bool markedAllAsRead;
  final NotificationEntity? markedAsRead;

  final bool isLoadingList;
  final bool isMarkingAsRead;
  final bool isMarkingAllAsRead;
  final bool isLoadingCount;

  final String? errorMessageGetAll;
  final String? errorMessageUnreadCount;
  final String? errorMessageMarkAsRead;
  final String? errorMessageMarkAllAsRead;

  const NotificationsState({
    this.markedAsRead,
    this.markedAllAsRead = false,
    this.notifications = const [],
    this.unreadCount = 0,
    this.isLoadingList = false,
    this.isMarkingAsRead = false,
    this.isMarkingAllAsRead = false,
    this.isLoadingCount = false,
    this.errorMessageGetAll,
    this.notificationsLoaded = false,
    this.errorMessageUnreadCount,
    this.errorMessageMarkAllAsRead,
    this.errorMessageMarkAsRead,
  });

  factory NotificationsState.initial() {
    return const NotificationsState(
      isLoadingList: false,
      isMarkingAsRead: false,
      isMarkingAllAsRead: false,
      isLoadingCount: false,
      notifications: [],
      errorMessageGetAll: null,
      errorMessageMarkAllAsRead: null,
      errorMessageMarkAsRead: null,
      errorMessageUnreadCount: null,
      markedAsRead: null,
      markedAllAsRead: false,
      unreadCount: 0,
      notificationsLoaded: false,
    );
  }

  NotificationsState copyWith({
    List<NotificationEntity>? notifications,
    int? unreadCount,
    bool? isLoadingList,
    bool? isMarkingAsRead,
    bool? isMarkingAllAsRead,
    bool? isLoadingCount,
    String? errorMessageGetAll,
    String? errorMessageMarkAsRead,
    String? errorMessageMarkAllAsRead,
    String? errorMessageUnreadCount,
    NotificationEntity? markedAsRead,
    bool? markedAllAsRead,
    bool? notificationsLoaded,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
      isLoadingList: isLoadingList ?? this.isLoadingList,
      isMarkingAsRead: isMarkingAsRead ?? this.isMarkingAsRead,
      isMarkingAllAsRead: isMarkingAllAsRead ?? this.isMarkingAllAsRead,
      isLoadingCount: isLoadingCount ?? this.isLoadingCount,
      errorMessageGetAll: errorMessageGetAll,
      markedAsRead: markedAsRead,
      markedAllAsRead: markedAllAsRead ?? this.markedAllAsRead,
      notificationsLoaded: notificationsLoaded ?? this.notificationsLoaded,
      errorMessageMarkAllAsRead: errorMessageMarkAllAsRead,
      errorMessageMarkAsRead: errorMessageMarkAsRead,
      errorMessageUnreadCount: errorMessageUnreadCount,
    );
  }
}
