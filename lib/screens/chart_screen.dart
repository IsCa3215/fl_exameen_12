import 'package:NutriMate/models/usuario.dart';
import 'package:NutriMate/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class CaloriasChart extends StatefulWidget {
  @override
  _CaloriasChartState createState() => _CaloriasChartState();
}

class _CaloriasChartState extends State<CaloriasChart> {
  List<BarChartGroupData> _chartData =
      []; // lista para los barchart de las recetas
  List<String> _recipeNames = []; // lista para los nombres de las recetas
  int? _selectedIndex; // indice seleccionado en el barchart de las recetas
  List<PieChartSectionData> _pieSections =
      []; // lista para los piechart de las recetas
  int? _hoveredIndex; // indice seleccionado en el piechart de las recetas

  get usuario => null;
/**
 * Estado inicial del widget en el cual vamos a llamar a la función _fetchData que nos va a cargar los datos de la base de datos
 */
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

/**
 * Función que nos va a cargar los datos de la base de datos en la lista _chartData y _recipeNames para poder mostrarlos en el gráfico de barras
 * Buscamos una colección llamada recetas en la base de datos y obtenemos los datos de cada receta para mostrarlos en el gráfico
 * Cada receta tiene un nombre y un número de calorías, los cuales vamos a guardar en la lista _recipeNames y en la lista _chartData respectivamente
 * y recorremos cada receta para obtener los datos y guardarlos en las listas
 */
  Future<void> _fetchData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('recetas_ismael').get();
    final List<BarChartGroupData> chartData = [];
    final List<PieChartSectionData> pieData = [];
    final List<String> names = [];
    final List<Color> colors = [
      // lista de colores para los piechart de las recetas
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple
    ];

    for (int i = 0; i < snapshot.docs.length; i++) {
      // recorremos cada receta para obtener los datos y guardarlos en las listas barData y pieData
      final doc = snapshot.docs[i];
      final data = doc.data() as Map<String, dynamic>;
      final String name = data['name'] ?? 'Desconocido';
      final int calories = data['calories'] ?? 0;
      names.add(name);

      chartData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: calories.toDouble(),
              color: Colors.blue,
              width: 16,
              borderRadius: BorderRadius.circular(4),
            )
          ],
        ),
      );

      pieData.add(
        PieChartSectionData(
          color: colors[i % colors.length],
          value: calories.toDouble(),
          title: '${calories} cal',
          titleStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          radius: _hoveredIndex == i ? 70 : 60,
        ),
      );
    }
/**
 * El setState nos va a permitir actualizar el estado del widget con los datos que hemos obtenido de la base de datos
 */
    setState(() {
      _chartData = chartData;
      _pieSections = pieData;
      _recipeNames = names;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomAppbar(title: 'Progreso', user: usuario),
      ],
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Calorías por Receta",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  barGroups: _chartData,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // función para mostrar los nombres de las recetas en el barchart
                          int index = value.toInt();
                          return GestureDetector(
                            // widget para mostrar los nombres de las recetas en el barchart
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                _recipeNames[index].substring(0, 3),
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        if (_selectedIndex == groupIndex) {
                          return BarTooltipItem(
                            // widget para mostrar las calorías de las recetas en el barchart al seleccionar una receta
                            '${_recipeNames[groupIndex]}: ${rod.toY.toInt()} cal', // texto que se va a mostrar al seleccionar una receta en el barchart
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          );
                        }
                        return null;
                      },
                    ),
                    touchCallback: (event, response) {
                      if (response != null && response.spot != null) {
                        setState(() {
                          _selectedIndex = response.spot!.touchedBarGroupIndex;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Text("Distribución de Calorías",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PieChart(
                    PieChartData(
                      sections: _pieSections,
                      pieTouchData: PieTouchData(
                        // widget para mostrar las calorías de las recetas en el piechart
                        touchCallback: (event, response) {
                          // función para mostrar las calorías de las recetas en el piechart
                          setState(() {
                            // widget para mostrar las calorías de las recetas en el piechart al seleccionar una receta
                            _hoveredIndex =
                                response?.touchedSection?.touchedSectionIndex;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_recipeNames.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: _pieSections[index].color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(_recipeNames[index],
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
