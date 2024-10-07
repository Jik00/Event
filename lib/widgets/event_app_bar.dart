import 'package:flutter/material.dart';

class EventAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
