import 'package:bloc/bloc.dart';
import 'package:client_app/core/services/firebase_service.dart';
import 'package:client_app/features/auth/domain/repositories/initial_values_repository.dart';
import 'package:flutter/material.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final InitialValuesRepository initialValuesRepository;
  final FirebaseNotifications firebaseNotifications;

  NotificationsCubit({
    required this.initialValuesRepository,
    required this.firebaseNotifications,
  }) : super(NotificationsInitial());

  Future<void> updateFCMToken() async {
    emit(
      NotificationsLoading(notificationAction: NotificationAction.updateFCM),
    );
    final tokenEither = await firebaseNotifications.getToken();
    final token = await tokenEither.fold((failure) {
      emit(
        NotificationsError(
          message: failure.message,
          notificationAction: NotificationAction.updateFCM,
        ),
      );
      return null;
    }, (token) => Future.value(token));

    if (token == null) return;

    final updateEither = await initialValuesRepository.updateFCMToken(
      fcmToken: token,
    );

    updateEither.fold(
      (failure) => emit(
        NotificationsError(
          message: failure.message,
          notificationAction: NotificationAction.updateFCM,
        ),
      ),
      (_) => emit(NotificationsTokenUpdated()),
    );
  }

  Future<void> requestPermissions() async {
    emit(
      NotificationsLoading(
        notificationAction: NotificationAction.requestPermissions,
      ),
    );
    final response = await firebaseNotifications.requestPermissions();
    response.fold(
      (l) => emit(
        NotificationsError(
          message: l.message,
          notificationAction: NotificationAction.requestPermissions,
        ),
      ),
      (r) => emit(NotificationsPermitsGranted()),
    );
  }
}
