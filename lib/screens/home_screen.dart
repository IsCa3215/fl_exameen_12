import 'package:NutriMate/models/meeting.dart';
import 'package:NutriMate/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/entities.dart';
import '../widgets/widgets.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final Usuario user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Meeting> _meetings = [];
  String _selectedEvent = "";

  void _addEvent(String eventName, DateTime dateTime) {
    final Meeting newMeeting = Meeting(
      eventName,
      dateTime,
      dateTime.add(const Duration(hours: 1)),
      Colors.blue,
      false,
    );
    setState(() {
      _meetings.add(newMeeting);
    });
  }

  void _showAddEventDialog() {
    final TextEditingController eventController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Añadir Evento"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: eventController,
                    decoration:
                        const InputDecoration(hintText: "Nombre del evento"),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(selectedDate),
                        );
                        if (pickedTime != null) {
                          setStateDialog(() {
                            selectedDate = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      }
                    },
                    child: Text(
                      "Seleccionar fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(selectedDate)}",
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    if (eventController.text.isNotEmpty) {
                      _addEvent(eventController.text, selectedDate);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Añadir"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    final String nombre = usuario.name;
    final String apellido = usuario.lastName.split(" ")[0];

    return Scaffold(

      body: Column(
        children: [
          // Contenido principal con NestedScrollView
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                    child: SizedBox
                        .shrink()), // Header vacío si no necesitas algo aquí
              ],
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SwiperFoodLabel(day: 'Lunes', label: "Dieta del día"),
                    SwiperFood(cliente: usuario, icon: Icons.edit),

                    // Widget de información del evento seleccionado
                    if (_selectedEvent.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: EventInfoWidget(selectedEvent: _selectedEvent),
                      ),

                    // Calendario con reuniones
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: CalendarWidget(
                        meetings: _meetings,
                        onEventSelected: (event) {
                          setState(() {
                            _selectedEvent = event;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
