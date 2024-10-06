import 'package:flutter/material.dart';
import 'views/event_home_page.dart';

void main() {
  runApp(EventCountdownApp());
}

class EventCountdownApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Countdown',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
          bodyText2: TextStyle(color: Colors.black54, fontFamily: 'Poppins'),
        ),
      ),
      home: EventHomePage(),
    );
  }
}
