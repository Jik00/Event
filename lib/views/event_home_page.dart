import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/event_view_model.dart';
import 'event_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event Countdown', style: TextStyle(fontFamily: 'Poppins')),
          backgroundColor: Colors.teal,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<EventViewModel>(
            builder: (context, eventViewModel, child) {
              return Column(
                children: [
                  Expanded(
                    child: eventViewModel.events.isEmpty
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
                                onEdit: () {
                                  _showEditEventDialog(context, eventViewModel, index, event.name, event.date);
                                },
                                onDelete: () {
                                  eventViewModel.deleteEvent(index);
                                },
                              );
                            },
                          ),
                  ),
                  Padding(
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
                      onPressed: () {
                        _showAddEventDialog(context, eventViewModel);
                      },
                      child: Text(
                        'Add Event',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _showAddEventDialog(BuildContext context, EventViewModel eventViewModel) {
    String eventName = '';
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Add New Event', style: TextStyle(color: Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  eventName = value;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    selectedDate = picked;
                  }
                },
                child: Text('Select Date', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (eventName.isNotEmpty) {
                  eventViewModel.addEvent(eventName, selectedDate);
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showEditEventDialog(BuildContext context, EventViewModel eventViewModel, int index, String eventName, DateTime eventDate) {
    String updatedName = eventName;
    DateTime selectedDate = eventDate;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Edit Event', style: TextStyle(color: Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: eventName),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  updatedName = value;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    selectedDate = picked;
                  }
                },
                child: Text('Select Date', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (updatedName.isNotEmpty) {
                  eventViewModel.editEvent(index, updatedName, selectedDate);
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text('Update', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
