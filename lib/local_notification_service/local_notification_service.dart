import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  // create object
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse notificationResponse){}
  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse:onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }
  // Basic notification
  static void showBasicNotification() async{
    // id / title / body / notificationDetails
    NotificationDetails details = const NotificationDetails(android: AndroidNotificationDetails(
      'id 1',
      'basic notification', // channel name
    ),
    );
    await flutterLocalNotificationsPlugin.show( 0, 'Basic Notification', 'body', details);

  }
}
