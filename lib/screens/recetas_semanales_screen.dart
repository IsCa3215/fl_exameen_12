import 'package:NutriMate/screens/menus_semanales_screen.dart';
import 'package:flutter/material.dart';
import '../models/entities.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';

class RecetasSemanalesScreen extends StatelessWidget {
  final Usuario cliente;
  const RecetasSemanalesScreen({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    bool isSpecialUser = usuario.email == 'admin@nutrimate.com';
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppbar(title: 'Recetas semanales', user: usuario),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (isSpecialUser)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MenusSemanalesScreen(cliente: cliente),
                        ),
                      );
                    },
                    child: const Text('Cambiar menú'),
                  ),
                ),
              const SwiperFoodLabel(day: 'Lunes', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 0),
              const SwiperFoodLabel(day: 'Martes', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 1),
              const SwiperFoodLabel(day: 'Miércoles', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 2),
              const SwiperFoodLabel(day: 'Jueves', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 3),
              const SwiperFoodLabel(day: 'Viernes', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 4),
              const SwiperFoodLabel(day: 'Sábado', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 5),
              const SwiperFoodLabel(day: 'Domingo', label: "Dieta del día"),
              SwiperFood(cliente: cliente, icon: Icons.edit, day: 6),
            ],
          ),
        ),
      ),
    );
  }
}
