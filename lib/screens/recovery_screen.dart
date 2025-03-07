import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/firebase_auth_service.dart';
import '../widgets/widgets.dart';

class RecoveryScreen extends StatelessWidget {
  RecoveryScreen({Key? key}) : super(key: key);
  final _recoveryFormKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'email': '',
    };
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
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
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: screenWidth / 1.6,
              ),
              Text('¿Has olvidado tu contraseña?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 15),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 1000),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Introduce el email que usaste para registrarte en Nutrimate y te enviaremos un correo con instrucciones para recuperar tu contraseña',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Form(
                  key: _recoveryFormKey,
                  child: Column(children: [
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth / 1.2,
                      child: CustomEmailFormField(
                        hintText: 'Email',
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        formProperty: 'email',
                        formValues: formValues,
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: ElevatedButton(
                          child: const Text('Recuperar contraseña'),
                          onPressed: () {
                            if (_recoveryFormKey.currentState!.validate()) {
                              _auth.resetPassword(
                                  formValues['email']!, context);
                            }
                          }),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    ]));
  }
}
