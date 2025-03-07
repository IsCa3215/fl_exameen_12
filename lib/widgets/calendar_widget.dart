import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../models/meeting.dart';
import '../models/meeting_data_source.dart';

class CalendarWidget extends StatefulWidget {
  final List<Meeting> meetings;
  const CalendarWidget({
    super.key,
    required this.meetings,
    required Null Function(dynamic event) onEventSelected,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  String _selectedEvent = "Selecciona un evento";
  void _onCalendarTap(CalendarTapDetails details) {
    if (details.appointments != null && details.appointments!.isNotEmpty) {
      setState(() {
        _selectedEvent = (details.appointments!.first as Meeting).eventName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey[200],
          width: double.infinity,
          child: Text(
            _selectedEvent,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: MeetingDataSource(widget.meetings),
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            ),
            onTap: _onCalendarTap,
          ),
        ),
      ],
    );
  }
}
