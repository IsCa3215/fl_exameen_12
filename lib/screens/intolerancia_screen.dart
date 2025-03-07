
/**
 * crear un formulario para que el usuario pueda ingresar una intolerancia
 * validar el campo del formulario quede relleno 
 * guardar la intolerancia en la base de datos
 * el formulario debe tener un botón para enviar los datos
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IntoleranciaScreen extends StatefulWidget {
  const IntoleranciaScreen({super.key});

  @override
  State<IntoleranciaScreen> createState() => _IntoleranciaScreenState();
}
  final TextEditingController intoleranciaController = TextEditingController();


Future<void> _fetchData() async {
  await FirebaseFirestore.instance.collection('intolerancias_ismael').add({
    "intolerancia": intoleranciaController.text,
  });
}

class _IntoleranciaScreenState extends State<IntoleranciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intolerancias'),
      ),
      body: Center(
        child: Form(child: ListView(
              children: [
                TextFormField(
                  controller: intoleranciaController,
                  decoration: InputDecoration(labelText: "Intolerancia"),
                  validator: (value) =>
                      value!.isEmpty ? "Ingresa una intolerancia" : null,
                ),
                FloatingActionButton(
                child: Text("Añadir"),
                  onPressed: () {
                    if (intoleranciaController.text.isEmpty) {
                      return;
                    } else {
                      _fetchData();
                    }
                })
              ]
        ),
      ),
      
    )
    );
  }
}
