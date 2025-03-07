import 'package:flutter/material.dart';

class SettingOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  SettingOption({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen,
  });
}
