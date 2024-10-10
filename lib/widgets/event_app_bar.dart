import 'package:flutter/material.dart';

class EventAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EventAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Event Countdown',
         style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          ),
          ),
      backgroundColor: Colors.teal,
      
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
