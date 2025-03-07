import 'package:flutter/material.dart';

class EventInfoWidget extends StatelessWidget {
  final String selectedEvent;
  const EventInfoWidget({super.key, required this.selectedEvent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey[200],
      width: double.infinity,
      child: Text(
        selectedEvent,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
