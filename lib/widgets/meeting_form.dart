import 'package:flutter/material.dart';
import '../models/meeting.dart';

class MeetingForm extends StatefulWidget {
  @override
  _MeetingFormState createState() => _MeetingFormState();
}

class _MeetingFormState extends State<MeetingForm> {
  final TextEditingController _titleController = TextEditingController();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(hours: 1));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar reunión'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _startTime,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() => _startTime = picked);
              }
            },
            child: Text('Seleccionar fecha: ${_startTime.toLocal()}'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final newMeeting = Meeting(
              _titleController.text,
              _startTime,
              _endTime,
              Colors.blue,
              false,
            );
            Navigator.pop(context, newMeeting);
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
