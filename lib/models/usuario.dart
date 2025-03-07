import 'entities.dart';

class Usuario {
  final String email;
  final String name;
  final String lastName;
  final double weight;
  final MenuSemanal menu;

  Usuario({
    required this.email,
    required this.name,
    required this.lastName,
    required this.weight,
    required this.menu,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      email: map['email'] ?? '',
      name: map['nombre'] ?? '',
      lastName: map['apellidos'] ?? '',
      weight: map['peso']?.toDouble() ?? 0.0,
      menu: map['menu'] != null
          ? MenuSemanal.fromMap(map['menu'])
          : MenuSemanal(menusDiarios: [], nombreMenuSemanal: ''),
    );
  }
}
