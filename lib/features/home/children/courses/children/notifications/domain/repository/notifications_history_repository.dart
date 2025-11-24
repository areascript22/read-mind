import 'dart:ui';

import 'package:client_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entity/notification_entity.dart';

abstract interface class NotificationsHistoryRepository {
  Future<Either<Failure, List<NotificationEntity>>> getUserNotifications();

  Future<Either<Failure, NotificationEntity>> markAsRead({
    required int notificationId,
  });

  Future<Either<Failure, String>> markAllAsRead();
  Future<Either<Failure, int>> getUnreadCount();

  void connectSocket(int userId, VoidCallback onNewNotification);
  void disconnectSocket();
}
