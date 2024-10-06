import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final DateTime eventDate;
  final String countdown;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.countdown,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade300, Colors.teal.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventName,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(height: 6),
            Text(
              countdown,
              style: TextStyle(
                  fontSize: 18, color: Colors.white70, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 10),
            Text(
              'Event Date: ${DateFormat('yyyy-MM-dd').format(eventDate)}',
              style: TextStyle(
                  fontSize: 14, color: Colors.white70, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onEdit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.teal, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.teal),
                      SizedBox(width: 5),
                      Text('Edit', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.white),
                      SizedBox(width: 5),
                      Text('Delete', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
