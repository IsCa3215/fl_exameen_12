import 'package:NutriMate/models/usuario.dart';
import 'package:NutriMate/services/firebase_service.dart';
import 'package:NutriMate/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CardUser extends StatefulWidget {
  const CardUser({super.key, required this.user});

  final Usuario user;

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  late double currentWeight;

  @override
  void initState() {
    super.initState();
    currentWeight = widget.user.weight;
  }

  void _updateWeight(double newWeight) {
    setState(() {
      currentWeight = newWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: const Color.fromARGB(255, 245, 242, 220).withAlpha(100),
          width: double.infinity,
          height: 475,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text(widget.user.name[0] + widget.user.lastName[0]),
                  backgroundColor: AppTheme.primary,
                  radius: 50,
                ),
                const SizedBox(height: 15),
                Text(
                  widget.user.name + " " + widget.user.lastName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.user.email,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _WeightCard(text: 'Peso inicial', weight: 70.0),
                    const SizedBox(width: 10),
                    _WeightCard(text: 'Peso actual', weight: currentWeight),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _UpdateWeightButton(
                  user: widget.user,
                  onWeightUpdated: _updateWeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UpdateWeightButton extends StatelessWidget {
  final Usuario user;
  final Function(double) onWeightUpdated;

  const _UpdateWeightButton({
    required this.user,
    required this.onWeightUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showUpdateWeightDialog(context, user);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
      child: const Text('ACTUALIZAR PESO'),
    );
  }

  void _showUpdateWeightDialog(BuildContext context, Usuario user) {
    final TextEditingController weightController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Actualizar Peso',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Introduce tu peso actual',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppTheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.monitor_weight_outlined,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'CANCELAR',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (weightController.text.isNotEmpty) {
                  final newWeight = double.tryParse(weightController.text);
                  if (newWeight != null) {
                    try {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primary,
                          ),
                        ),
                      );

                      await updateUserWeigth(_auth.currentUser!.uid, newWeight);

                      Navigator.of(context).pop();

                      Navigator.of(context).pop();

                      onWeightUpdated(newWeight);
                    } catch (e) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: "Error al actualizar peso",
                        confirmBtnText: "OK",
                        confirmBtnColor: AppTheme.primary,
                        onConfirmBtnTap: () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('GUARDAR'),
            ),
          ],
        );
      },
    );
  }
}

class _WeightCard extends StatelessWidget {
  final String text;
  final double weight;
  const _WeightCard({
    required this.text,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${weight.toStringAsFixed(1)} kg',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
