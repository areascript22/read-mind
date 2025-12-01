import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("🔔 Background notification: ${message.messageId}");
}

class FirebaseNotifications {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<Either<Failure, FirebaseApp>> initializeFirebase() async {
    try {
      final firebaseApp = await Firebase.initializeApp();
      return right(firebaseApp);
    } catch (e) {
      return left(Failure("Error initializing Firebase: $e"));
    }
  }

  Future<Either<Failure, Unit>> setupBackgroundHandler() async {
    try {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      return right(unit);
    } catch (e) {
      return left(Failure("Failed to set background handler: $e"));
    }
  }

  Future<Either<Failure, NotificationSettings>> requestPermissions() async {
    try {
      print("Requesting permissions");
      final result = await _messaging.requestPermission();
      print("Permission just granted: ${result.authorizationStatus}");
      return right(result);
    } catch (e) {
      return left(Failure("Failed to set background handler: $e"));
    }
  }

  Future<Either<Failure, NotificationSettings>> permissionsStatus() async {
    try {
      final result = await _messaging.getNotificationSettings();
      return right(result);
    } catch (e) {
      return left(Failure("Failed to set background handler: $e"));
    }
  }

  Future<Either<Failure, String>> getToken() async {
    try {
      final token = await _messaging.getToken();
      if (token == null) {
        return left(Failure("Token is null"));
      }
      log("🔥 FCM TOKEN: $token");
      return right(token);
    } catch (e) {
      return left(Failure("Failed to get FCM token: $e"));
    }
  }

  Future<Either<Failure, Unit>> setupOnMessageListener() async {
    try {
      FirebaseMessaging.onMessage.listen((message) {
        log("📩 Foreground notification received:");
        log("Título: ${message.notification?.title}");
        log("Cuerpo: ${message.notification?.body}");
      });
      return right(unit);
    } catch (e) {
      return left(Failure("Failed to set foreground listener: $e"));
    }
  }

  Future<Either<Failure, Unit>> setupOnMessageOpenedListener() async {
    try {
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        log("📲 App opened from notification: ${message.messageId}");
      });
      return right(unit);
    } catch (e) {
      return left(Failure("Failed to set opened-app listener: $e"));
    }
  }
}
