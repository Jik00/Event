import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../view_models/event_view_model.dart';
import '../views/event_card.dart';

class EventList extends StatelessWidget {
  final EventViewModel eventViewModel;
  final Function(BuildContext, int, String, DateTime) onEdit;
  final Function(int) onDelete;

  const EventList({
    super.key,
    required this.eventViewModel,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return eventViewModel.events.isEmpty
        ? Center(
            child: SvgPicture.asset(
              'lib/assets/images/Event_pic.svg', // Replace with your SVG asset path
              height: 200, // Adjust height as needed
              width: 200,  // Adjust width as needed
            ),
          )
        : ListView.builder(
            itemCount: eventViewModel.events.length,
            itemBuilder: (context, index) {
              final event = eventViewModel.events[index];
              return EventCard(
                eventName: event.name,
                eventDate: event.date,
                countdown: eventViewModel.getCountdown(event.date),
                onEdit: () => onEdit(context, index, event.name, event.date), // Corrected here
                onDelete: () => onDelete(index),
              );
            },
          );
  }
}
