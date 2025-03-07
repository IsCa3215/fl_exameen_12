import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/entities.dart';
import '../services/services.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  Map<String, dynamic>? _userData;
  Usuario? _usuario;

  UserProvider() {
    loadUser();
  }

  Future<void> loadUser() async {
    final user = await getUser();
    if (user != null) {
      print('UserProvider: User loaded: ${user.email}');
      _user = user;
      _userData = await getUserData(user.uid);
      if (_userData != null) {
        _usuario = Usuario.fromMap(_userData!);
      }
      notifyListeners();
    }
  }

  User? get user => _user;
  Usuario? get usuario => _usuario;

  Future<User?> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}
