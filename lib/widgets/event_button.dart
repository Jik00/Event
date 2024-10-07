import 'package:flutter/material.dart';

class EventButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EventButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 6,
          shadowColor: Colors.tealAccent.withOpacity(0.5),
        ),
        onPressed: onPressed,
        child: Text(
          'Add Event',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
