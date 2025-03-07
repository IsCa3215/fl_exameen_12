import 'entities.dart';

final Recipe cena = Recipe(
    name: "Pizza de cacahuetes",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rionegro.com.ar%2Fwp-content%2Fuploads%2F2022%2F02%2FPanqueques-de-avena-tres-recetas.jpg&f=1&nofb=1&ipt=e51822a1f52fc193020b20ef7c594d843e11afab4500a392ca8ea3c8f78a8859&ipo=images",
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
    calories: 207
);

final List<Recipe> recipes = [
  Recipe(
    name: "Panqueques de avena",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rionegro.com.ar%2Fwp-content%2Fuploads%2F2022%2F02%2FPanqueques-de-avena-tres-recetas.jpg&f=1&nofb=1&ipt=e51822a1f52fc193020b20ef7c594d843e11afab4500a392ca8ea3c8f78a8859&ipo=images",
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
    calories: 330
  ),
  Recipe(
    name: "Tostadas con aguacate y huevo",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.haceloconhuevos.com%2Fwp-content%2Fuploads%2F2022%2F02%2FTOSTADA-DE-AGUACATE-Y-HUEVO-FRITO.jpg&f=1&nofb=1&ipt=aeb0a3157305fe610a3d4cbdbfe5acb4492052f749eaaeb0e3a0536350c68023&ipo=images",
    ingredients: [
      {"ingredientName": "2 rebanadas de pan integral", "isSelected": false},
      {"ingredientName": "1 aguacate maduro", "isSelected": false},
      {"ingredientName": "2 huevos", "isSelected": false},
      {"ingredientName": "Sal y pimienta al gusto", "isSelected": false},
      {"ingredientName": "Aceite de oliva", "isSelected": false}
    ],
    instructions: [
      "Tostar el pan hasta que esté dorado.",
      "Aplastar el aguacate y esparcir sobre las tostadas.",
      "Freír o hervir los huevos y colocarlos sobre las tostadas.",
      "Agregar sal, pimienta y un chorrito de aceite de oliva."
    ],
    type: MealType.breakfast,
    category: 'Equilibrado',
    calories: 490
  ),
  Recipe(
    name: "Ensalada César con pollo",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frecetasdepollo.online%2Fwp-content%2Fuploads%2F2017%2F09%2Fensalada-cesar-con-pollo.jpg&f=1&nofb=1&ipt=e9c63aab2eb5e9c95757e23d4e37f085f1ee3c454dd54850cd4c08e596f7a0d4&ipo=images",
    ingredients: [
      {
        "ingredientName": "1 pechuga de pollo a la parrilla",
        "isSelected": false
      },
      {"ingredientName": "1 lechuga romana", "isSelected": false},
      {"ingredientName": "Crutones", "isSelected": false},
      {"ingredientName": "Queso parmesano", "isSelected": false},
      {"ingredientName": "Aderezo César", "isSelected": false}
    ],
    instructions: [
      "Cortar la lechuga y colocarla en un bol.",
      "Añadir crutones, queso parmesano y el pollo en tiras.",
      "Rociar con aderezo César y mezclar bien.",
      "Servir de inmediato."
    ],
    type: MealType.lunch,
    category: 'Equilibrado',
    calories: 210
  ),
];

final List<Recipe> recipes2 = [
  Recipe(
    name: "Arroz con pollo",
    imageUrl:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.cookipedia.co.uk%2Fwiki%2Fimages%2F0%2F07%2FArroz_con_pollo_recipe.jpg&f=1&nofb=1&ipt=9ab7deaa2b419d4669d6a82880bc08f17551ed24f777b1e3dc0f442c5e4501b9&ipo=images",
    ingredients: [
      {"ingredientName": "Arroz", "isSelected": false},
      {"ingredientName": "Pollo", "isSelected": false},
      {"ingredientName": "Pimiento", "isSelected": false},
      {"ingredientName": "Zanahoria", "isSelected": false},
      {"ingredientName": "Cebolla", "isSelected": false}
    ],
    instructions: [
      "Cocinar el arroz según instrucciones.",
      "En una sartén, sofreír la cebolla, pimiento y zanahoria.",
      "Agregar el pollo y cocinar hasta que esté dorado.",
      "Añadir el arroz y mezclar bien.",
      "Cocinar por unos minutos y servir."
    ],
    type: MealType.lunch,
    category: 'Aumento masa muscular',
    calories: 860
  ),
  Recipe(
      name: "Salmón a la plancha con espárragos",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcocina.guru%2Fwp-content%2Fuploads%2F2019%2F10%2Frecetas-salmon-a-la-plancha.jpg&f=1&nofb=1&ipt=9fac7a25777f0f7697c91d7a714c91b9af40b804d4690600f8a6739e0451b9e0&ipo=images",
      ingredients: [
        {"ingredientName": "Salmón", "isSelected": false},
        {"ingredientName": "Espárragos", "isSelected": false},
        {"ingredientName": "Limón", "isSelected": false},
        {"ingredientName": "Aceite", "isSelected": false},
      ],
      instructions: [
        "Sazonar el salmón con sal, pimienta y un poco de aceite de oliva.",
        "Cocinar en una sartén caliente por 3-4 minutos por cada lado.",
        "En la misma sartén, saltear los espárragos con un poco de aceite.",
        "Servir con rodajas de limón al gusto."
      ],
      type: MealType.dinner,
      calories: 790,
      category: 'Bajo en grasas'),
  Recipe(
    name:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frecetacubana.es%2Fwp-content%2Fuploads%2F2019%2F04%2Falbondigas-receta.jpg&f=1&nofb=1&ipt=7712a514a9156e209f122868a799daaac3fb7ddb4938447aa3f2afbea15d53d1&ipo=images",
    imageUrl: "https://example.com/pasta.jpg",
    ingredients: [
      {"ingredientName": "Pasta", "isSelected": false},
      {"ingredientName": "Tomate", "isSelected": false},
      {"ingredientName": "Albóndigas", "isSelected": false},
      {"ingredientName": "Zanahoria", "isSelected": false},
      {"ingredientName": "Cebolla", "isSelected": false}
    ],
    instructions: [
      "Cocinar la pasta según las instrucciones del paquete.",
      "Dorar las albóndigas en una sartén.",
      "Añadir el ajo picado y el tomate triturado.",
      "Cocinar a fuego lento por 10 minutos.",
      "Mezclar la salsa con la pasta y servir caliente."
    ],
    type: MealType.dinner,
    category: 'Equilibrado',
    calories: 839
  ),
  Recipe(
      name: "Sopa de lentejas",
      imageUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn2.cocinadelirante.com%2Fsites%2Fdefault%2Ffiles%2Fimages%2F2018%2F03%2Freceta-facil-de-sopa-de-lentejas-con-tocino.jpg&f=1&nofb=1&ipt=46a06acb660b91c90c66afb4e4ef01daecdabeeb60ed756461a11b09c772f718&ipo=images",
      ingredients: [
        {"ingredientName": "Lentejas", "isSelected": false},
        {"ingredientName": "Ajo", "isSelected": false},
        {"ingredientName": "Zanahoria", "isSelected": false},
        {"ingredientName": "Cebolla", "isSelected": false}
      ],
      instructions: [
        "En una olla, sofreír la cebolla, zanahoria y ajo.",
        "Añadir las lentejas y el caldo de verduras.",
        "Cocinar a fuego medio hasta que las lentejas estén tiernas.",
        "Sazonar al gusto y servir caliente."
      ],
      type: MealType.dinner,
      calories: 780,
      category: 'Aumento masa muscular'),
];
