import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("🔔 Notificación en background: ${message.messageId}");
}

class FirebaseNotifications {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    try {
      // Inicializar Firebase
      await Firebase.initializeApp();

      // Registrar background handler
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      // Solicitar permisos (solo Android 13+ lo necesita)
      await _requestPermissions();

      // Obtener token FCM
      final token = await _messaging.getToken();
      log("🔥 TOKEN FCM: $token");

      // Aquí envías el token al backend Node.js
      // await sendTokenToBackend(token);

      // Listener cuando la app está en foreground
      FirebaseMessaging.onMessage.listen((message) {
        log("📩 Notificación recibida en FOREGROUND:");
        log("Título: ${message.notification?.title}");
        log("Cuerpo: ${message.notification?.body}");
      });

      // Listener cuando abren la app desde una notificación
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        log("📲 App abierta desde notificación: ${message.messageId}");
      });
    } catch (e) {
      print("Error initializing notifications: ${e}");
    }
  }

  /// Solicita permisos en Android 13+ (Tiramisu)
  static Future<void> _requestPermissions() async {
    final settings = await _messaging.requestPermission();
    log("🔐 Permisos de notificaciones: ${settings.authorizationStatus}");
  }
}
