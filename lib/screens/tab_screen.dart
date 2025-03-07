import 'package:NutriMate/models/usuario.dart';
import 'package:NutriMate/providers/user_provider.dart';
import 'package:NutriMate/screens/intolerancia_screen.dart';
import 'package:NutriMate/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  TabScreen({super.key});

  /// Para un código más legible, las listas las estoy definiendo por separado, en este caso screens pide una lista de Widgets
  /// que serán nuestras screens por lo tanto he creado una lista de tipo Widget y he metido las screen a usar

  List<Widget> _buildScreens(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    return [
      HomeScreen(
          user:
              usuario), // Si llamo a esta misma screen explota (Por experiencia) por lo que reemplazad esto por la main screen
      RecetasSemanalesScreen(
        cliente: usuario,
      ),
      CaloriasChart(),
      IntoleranciaScreen(),
      SettingsScreen(usuario: usuario),
      //aquí iría el config screen
    ];
  }

  ///
  ///* En esta lista vamos a guardar los items de la tabbar, aquí vamos a tener el nombre, color titulo etc de los botones
  ///* de la tabbar
  ///
  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_max),
        title: "Inicio",
        activeColorPrimary: const Color(0xFF00B894),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: const Color.fromARGB(255, 40, 38, 38),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month),
        title: "Recetas",
        activeColorPrimary: const Color(0xFF00B894),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_chart),
        title: "Progreso",
        activeColorPrimary: const Color(0xFF00B894),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: const Color.fromARGB(255, 40, 38, 38),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.warning),
        title: "Intolerancias",
        activeColorPrimary: const Color(0xFF00B894),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: const Color.fromARGB(255, 40, 38, 38),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Ajustes",
        activeColorPrimary: const Color(0xFF00B894),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: const Color.fromARGB(255, 40, 38, 38),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(context), // y aquí metemos las listas
      items: _navBarItems(),
      handleAndroidBackButtonPress: false,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
        duration: Duration(milliseconds: 550),
        curve: Curves.ease,
      )),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
