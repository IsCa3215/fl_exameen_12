import 'package:NutriMate/services/firebase_menu_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';

import '../models/entities.dart';
import '../widgets/widgets.dart';

class MenusDiariosScreen extends StatefulWidget {
  const MenusDiariosScreen({super.key});

  @override
  State<MenusDiariosScreen> createState() => _MenusDiariosScreenState();
}

class _MenusDiariosScreenState extends State<MenusDiariosScreen> {
  List<MenuDiario> _menusDiarios = [];

  @override
  void initState() {
    super.initState();
    _loadMenusDiarios();
  }

  Future<void> _loadMenusDiarios() async {
    final menusDiarios = await getMenusDiarios();
    setState(() {
      _menusDiarios = menusDiarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomAppbar(title: 'Menús diarios disponibles', user: usuario),
      ],
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: _menusDiarios.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final main = _menusDiarios[index];
          return InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(main.nombreMenuDiario),
            ),
          );
        },
      ),
    ));
  }
}
