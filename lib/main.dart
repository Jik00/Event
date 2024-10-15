import 'package:flutter/material.dart';
import 'local_notification_service/local_notification_service.dart';
import 'views/event_home_page.dart';

void main() async {
  // call the notification
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  runApp(const EventCountdownApp());
}

class EventCountdownApp extends StatelessWidget {
  const EventCountdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Event Countdown',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
            bodyMedium: TextStyle(color: Colors.black54, fontFamily: 'Poppins'),
          ),
        ),
        home: const EventHomePage(),
        );
    }
}