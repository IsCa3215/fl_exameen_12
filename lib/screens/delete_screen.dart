/**
 * el usuario podrá visualizar un listado con todas las intolerancias añadidas y eliminar el que crea conveniente
 * tanto de la app como de la base de datos al pulsar el icono de eliminar
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  List<String> intolerances = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  void _fetchData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('intolerancias_ismael').get();
    setState(() {
      intolerances = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data['intolerancia'] ?? 'nul';
      }).toList().cast<String>();
    });
  }
  void _deleteIntolerance(int index) {
    FirebaseFirestore.instance.collection('intolerancias_ismael').get().then((snapshot) {
      snapshot.docs[index].reference.delete();
    });
    setState(() {
      intolerances.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar intolerancias'),
      ),
      body: ListView.builder(
        itemCount: intolerances.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(intolerances[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteIntolerance(index),
            ),
          );
        },
      ),
    );
  }
}
