import 'package:NutriMate/routes/settings_routes.dart';
import 'package:NutriMate/services/firebase_auth_service.dart';
import 'package:NutriMate/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/widgets/widgets.dart';
import '../models/usuario.dart';
import 'screens.dart';

class SettingsScreen extends StatefulWidget {
  final Usuario usuario;
  SettingsScreen({Key? key, required this.usuario}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthService _auth = AuthService();
  final FirebaseAuth _auth2 = FirebaseAuth.instance;
  late Usuario _usuario;

  @override
  void initState() {
    super.initState();
    _usuario = widget.usuario; // Inicializamos el usuario
  }

  void _updateUser(Usuario updatedUser) {
    setState(() async {
      _usuario = updatedUser;
      await updateUser(_auth2.currentUser!.uid, updatedUser.email,
          updatedUser.name, updatedUser.lastName, updatedUser.weight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        CustomAppbar(
          title: 'Inicio',
          user: widget.usuario,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          CardUser(
            user: widget.usuario, // Usamos widget.user en lugar de user
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: List.generate(
              SettingsRoutes.SettingsOptions.length,
              (index) {
                final option = SettingsRoutes.SettingsOptions[index];
                final isLastItem =
                    index == SettingsRoutes.SettingsOptions.length - 1;
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(option.icon,
                          color: isLastItem ? Colors.red : null),
                      title: Text(
                        option.name,
                        style: TextStyle(
                          color: isLastItem ? Colors.red : null,
                          fontWeight:
                              isLastItem ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () async {
                        if (index == 0) {
                          // Llamada al popup para editar usuario
                          showUserEditDialog(
                            context,
                            _usuario,
                            _updateUser, // Pasamos la función que actualizará el usuario
                          );
                        } else if (isLastItem) {
                          await _auth.signOut(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        } else {
                          Navigator.pushNamed(context, option.route);
                        }
                      },
                    ),
                    if (!isLastItem) Divider(),
                  ],
                );
              },
            ),
          ),
        ])),
      ]),
    );
  }
}
