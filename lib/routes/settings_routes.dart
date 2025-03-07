import 'package:flutter/material.dart';
import '../models/settings_option.dart';

class SettingsRoutes {
  static final SettingsOptions = <SettingOption>[
    SettingOption(
      route: 'miCuenta',
      icon: Icons.account_circle,
      name: 'Mi Cuenta',
      screen: Container(),
    ),
    SettingOption(
      route: 'preferencias',
      icon: Icons.settings,
      name: 'Preferencias',
      screen: Container(),
    ),
    SettingOption(
      route: 'contacto',
      icon: Icons.contact_mail,
      name: 'Contacto',
      screen: Container(),
    ),
    SettingOption(
      route: 'ayuda',
      icon: Icons.help,
      name: 'Ayuda',
      screen: Container(),
    ),
    SettingOption(
      route: 'acercaDe',
      icon: Icons.info,
      name: 'Acerca de',
      screen: Container(),
    ),
    SettingOption(
      route: 'cerrarSesion',
      icon: Icons.logout,
      name: 'Cerrar Sesion',
      screen: Container(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in SettingsOptions) {
      appRoutes.addAll({option.route: (context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => Container());
  }
}
