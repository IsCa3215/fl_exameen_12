import 'package:NutriMate/models/entities.dart';

class MenuDiario {
  List<Recipe> recetas;
  String nombreMenuDiario;

  MenuDiario({required this.recetas, required this.nombreMenuDiario});

  Map<String, dynamic> toMap() {
    return {
      'nombreMenuDiario': nombreMenuDiario,
      'recetas': recetas.map((r) => r.toMap()).toList(),
    };
  }

  factory MenuDiario.fromMap(Map<String, dynamic> map) {
    return MenuDiario(
      nombreMenuDiario: map['nombreMenuDiario'],
      recetas: (map['recetas'] as List).map((r) => Recipe.fromMap(r)).toList(),
    );
  }
}

final menuDiario = MenuDiario(
  nombreMenuDiario: "Menú Diario 1",
  recetas: [
    Recipe(
      name: "Panqueques de avena",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rionegro.com.ar%2Fwp-content%2Fuploads%2F2022%2F02%2FPanqueques-de-avena-tres-recetas.jpg&f=1&nofb=1&ipt=9a17b9b0da17dabf85d960bdd42953cd99ac46bb8ac0ac596f1e08c097ede0c8&ipo=images",
      ingredients: [
        {"ingredientName": "1 taza de avena", "isSelected": false},
        {"ingredientName": "1 huevo", "isSelected": false},
        {"ingredientName": "1/2 taza de leche", "isSelected": false},
        {
          "ingredientName": "1 cucharadita de polvo de hornear",
          "isSelected": false
        },
        {"ingredientName": "1 cucharadita de miel", "isSelected": false},
      ],
      instructions: [
        "Mezclar todos los ingredientes en una licuadora hasta obtener una mezcla homogénea.",
        "Calentar una sartén y verter porciones de la mezcla.",
        "Cocinar hasta que aparezcan burbujas en la superficie, luego voltear.",
        "Servir con frutas o miel al gusto."
      ],
      type: MealType.breakfast,
      category: 'Bajo en grasas',
      calories: 330,
    ),
    Recipe(
      name: "Ensalada de quinoa",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-9cKcUVA5wrU%2FVUiK85AiSQI%2FAAAAAAAATl8%2FLG6oH7HhyvU%2Fs1600%2FIMG_6867.JPG&f=1&nofb=1&ipt=e78ab8f697c75032c22d275afede4e572ced5eb3297b99120451492150bbce21&ipo=images",
      ingredients: [
        {"ingredientName": "1 taza de quinoa cocida", "isSelected": false},
        {"ingredientName": "1 tomate picado", "isSelected": false},
        {"ingredientName": "1/2 pepino en rodajas", "isSelected": false},
        {"ingredientName": "Zumo de limón", "isSelected": false},
        {"ingredientName": "Aceite de oliva", "isSelected": false}
      ],
      instructions: [
        "Mezclar todos los ingredientes en un bol.",
        "Aliñar con zumo de limón y aceite de oliva.",
        "Servir frío."
      ],
      type: MealType.lunch,
      category: 'Saludable',
      calories: 760,
    ),
    Recipe(
      name: "Pechuga de pollo a la plancha",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FVRf8GGR9Chs%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=05faf6423422d9dd4e703209994e5efcb0c99bf1d3f801676af99d1cd2ebac65&ipo=images",
      ingredients: [
        {"ingredientName": "1 pechuga de pollo", "isSelected": false},
        {"ingredientName": "Sal y pimienta al gusto", "isSelected": false},
        {"ingredientName": "Aceite de oliva", "isSelected": false},
        {"ingredientName": "Rodajas de limón", "isSelected": false}
      ],
      instructions: [
        "Sazonar la pechuga de pollo con sal y pimienta.",
        "Cocinar a fuego medio en una sartén con aceite de oliva.",
        "Servir con rodajas de limón y una ensalada fresca."
      ],
      type: MealType.dinner,
      category: 'Proteico',
      calories: 450,
    ),
  ],
);
