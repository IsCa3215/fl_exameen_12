import 'package:NutriMate/models/entities.dart';
import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../services/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final _registerFormKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'nombre': '',
    'apellidos': '',
    'email': '',
    'password': ''
  };
  bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: screenWidth / 1.6,
                  ),
                  Form(
                    key: _registerFormKey,
                    child: Container(
                      width: screenWidth / 1.2,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextFormField(
                                        labelText: 'Nombre',
                                        hintText: 'Nombre',
                                        formProperty: 'nombre',
                                        formValues: formValues,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextFormField(
                                        labelText: 'Apellidos',
                                        hintText: 'Apellidos',
                                        formProperty: 'apellidos',
                                        formValues: formValues,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomEmailFormField(
                            labelText: 'Email',
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            formProperty: 'email',
                            formValues: formValues,
                          ),
                          const SizedBox(height: 15),
                          CustomPasswordFormField(
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                            formProperty: 'password',
                            formValues: formValues,
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: ElevatedButton(
                              child: const Text('Registrarse'),
                              onPressed: _isRegistering
                                  ? null
                                  : () async {
                                      if (_registerFormKey.currentState
                                              ?.validate() ??
                                          false) {
                                        setState(() {
                                          _isRegistering = true;
                                        });
                                        _registerFormKey.currentState?.save();
                                        await _authService.registerUser(
                                          nombre: formValues['nombre']!.trim(),
                                          apellidos:
                                              formValues['apellidos']!.trim(),
                                          email: formValues['email']!.trim(),
                                          password:
                                              formValues['password']!.trim(),
                                          menu: menu.toMap(),
                                          context: context,
                                        );
                                        setState(() {
                                          _isRegistering = false;
                                        });
                                      }
                                    },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(width: screenWidth / 1.2, child: const Divider()),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: screenWidth / 1.2,
                    child: SignInButton(
                      Buttons.google,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      text: "Iniciar sesión con Google",
                      onPressed: () {
                        _authService.signInWithGoogle(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
