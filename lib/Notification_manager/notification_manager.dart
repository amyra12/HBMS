import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager{
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void>initNotification()async{
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('flutter_logo');

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: (details) async {
        // Handle background notification response
      },
    );
  }

  Future<void>simpleNotificationShow() async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'Channel_id',
      'Channel_title',
      priority: Priority.high,
      importance: Importance.max,
      icon: 'flutter_logo',
      channelShowBadge: true,
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher')
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.show(0, 'Simple Notification', 'New bed to carbolize', notificationDetails);
  }
}