import 'dart:async';
import 'package:flutter/material.dart';
import '../models/event.dart';

class EventViewModel extends ChangeNotifier {
  final List<Event> _events = [];
  Timer? _timer;

  EventViewModel() {
    _startTimer();
  }

  List<Event> get events => List.unmodifiable(_events);

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void addEvent(String name, DateTime date) {
    _events.add(Event(name: name, date: date));
    notifyListeners();
  }

  void editEvent(int index, String name, DateTime date) {
    _events[index] = Event(name: name, date: date);
    notifyListeners();
  }

  void deleteEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }

  String getCountdown(DateTime eventDate) {
    final Duration difference = eventDate.difference(DateTime.now());
    if (difference.isNegative) {
      return 'Event passed';
    }
    final days = difference.inDays;
    final hours = difference.inHours.remainder(24);
    final minutes = difference.inMinutes.remainder(60);
    final seconds = difference.inSeconds.remainder(60);
    return '$days days, $hours hours, $minutes minutes, $seconds seconds';
  }
}
