import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/services.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final SessionManager _sessionManager = SessionManager();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _sessionManager.checkAuthAndRedirect(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/fondo.svg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SvgPicture.asset('assets/images/logo.svg',
                height: double.infinity),
          ),
        ],
      ),
    );
  }
}
