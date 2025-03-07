import 'package:NutriMate/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/usuario.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.user});

  final Usuario user;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primary.withAlpha(100),
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundColor: AppTheme.primary,
            child: Text(user.name[0] + user.lastName[0]),
          ),
        )
      ],
    );
  }
}
