import 'dart:async';
import 'dart:convert';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/notifications/service/socket_service.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../core/constants/app_environment.dart';
import '../../../../../../../../core/error/server_exception.dart';
import '../../domain/entity/notification_entity.dart';
import '../../domain/repository/notifications_history_repository.dart';
import '../model/notification/notification_model.dart';

class NotificationsHistoryRepositoryImpl
    implements NotificationsHistoryRepository {
  final AuthLocalDataSource authLocalDataSource;
  final SocketService socketService;

  NotificationsHistoryRepositoryImpl({
    required this.authLocalDataSource,
    required this.socketService,
  });
  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/notify/user/unreadCount",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al obtener valor");
      }

      final count = data['count'];

      return Right(count);
    } catch (e) {
      debugPrint("Error getting unread count $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("Servicio no disponible"));
    }
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>>
  getUserNotifications() async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/notify/user/all");
    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(
          data['message'] ?? "Error al obtener tus notificaciónes",
        );
      }
      final notifications =
          (data['data'] as List)
              .map((item) => NotificationModel.fromJson(item).toEntity())
              .toList();
      return Right(notifications);
    } catch (e) {
      debugPrint("Error getting user notifications $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar tus notificaciónes"));
    }
  }

  @override
  Future<Either<Failure, String>> markAllAsRead() async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/notify/readAll");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al actualizar datos");
      }
      final message = data['message'];
      return Right(message);
    } catch (e) {
      debugPrint("Error marking all as read $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("Servicio no disponible"));
    }
  }

  @override
  Future<Either<Failure, NotificationEntity>> markAsRead({
    required int notificationId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/notify/$notificationId/read",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al actualizar dato");
      }
      final notification = NotificationModel.fromJson(data['notification']);
      return Right(notification.toEntity());
    } catch (e) {
      debugPrint("Error updating as read $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("Servicio no disponible"));
    }
  }

  @override
  void connectSocket(int userId, VoidCallback onNewNotification) {
    socketService.connect(userId, onNewNotification);
    //socketService.addNotificationListener(onNewNotification);
  }

  @override
  void disconnectSocket() {
    socketService.disconnect();
  }
}
