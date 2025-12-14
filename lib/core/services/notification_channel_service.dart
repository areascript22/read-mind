import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationChannelService {
  NotificationChannelService._();

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel activityRemindersChannel =
      AndroidNotificationChannel(
        'activity_reminders',
        'Recordatorios de actividades',
        description: 'Recordatorios cuando una actividad está por vencer',
        importance: Importance.high,
        playSound: true,
      );

  static const AndroidNotificationChannel activityAlertsChannel =
      AndroidNotificationChannel(
        'activity_alerts',
        'Avisos de actividades',
        description: 'Notificaciones cuando se crea una nueva actividad',
        importance: Importance.high,
        playSound: true,
      );

  static const AndroidNotificationChannel generalAppNoticesChannel =
      AndroidNotificationChannel(
        'general_app_notices',
        'Avisos generales',
        description: 'Comunicados generales e información importante de la app',
        importance: Importance.defaultImportance,
        playSound: true,
      );

  static Future<void> init() async {
    final androidImplementation =
        _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    if (androidImplementation != null) {
      await androidImplementation.createNotificationChannel(
        activityRemindersChannel,
      );
      await androidImplementation.createNotificationChannel(
        activityAlertsChannel,
      );
      await androidImplementation.createNotificationChannel(
        generalAppNoticesChannel,
      );
    }
  }
}
