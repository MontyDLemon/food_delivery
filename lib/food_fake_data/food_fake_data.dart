import '../constant/png_icons.dart';
import '../models/burger.dart';
import '../models/enums.dart';
import '../models/food.dart';
import '../models/fries.dart';
import '../models/ingredient.dart';
import '../models/pizza.dart';
import '../models/salad.dart';

//dati a caso

List<Food> foods = [
  Pizza(
    name: "Margherita",
    price: 5.50,
    miniDescription: "La semplicità",
    description:
        "La pizza Margherita è la tipica pizza napoletana, condita con pomodoro, mozzarella, basilico fresco, sale e olio; è, insieme alla pizza marinara, la pizza italiana più popolare. ",
    category: FoodCategory.vegetarian,
    image: "assets/images/pizza/Margherita.png",
    isPopular: true,
    isWhitePizza: false,
    ingredients: [
      Ingredient(name: "Pomodoro", icon: PngIcons.withName(PngIcons.tomato)),
      Ingredient(
          name: "Mozzarella", icon: PngIcons.withName(PngIcons.mozzarella)),
    ],
  ),
  Pizza(
    name: "Marinara",
    price: 5.00,
    miniDescription: "semplice ma Deliziosa",
    description:
        "La pizza marinara è una tipica pizza napoletana condita con pomodoro, aglio, origano ed olio. Questa, insieme alla pizza Margherita, è tra le più popolari pizze napoletane.",
    category: FoodCategory.vegetarian,
    image: "assets/images/pizza/Marinara.png",
    isPopular: true,
    isWhitePizza: false,
    ingredients: [
      Ingredient(name: "Pomodoro", icon: PngIcons.withName(PngIcons.tomato)),
      Ingredient(name: "Aglio", icon: PngIcons.withName(PngIcons.aglio)),
      Ingredient(name: "Origano", icon: PngIcons.withName(PngIcons.origano)),
    ],
  ),
  Pizza(
    name: "Diavola",
    price: 6.50,
    miniDescription: "Per gli amanti del Piccante",
    description:
        "La pizza alla diavola deve il suo nome agli ingredienti piccanti, che devono letteralmente bruciare: una ricetta per i palati più coraggiosi!",
    category: FoodCategory.normal,
    image: "assets/images/pizza/Diavola.png",
    isPopular: true,
    isWhitePizza: false,
    ingredients: [
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Salame",
        icon: PngIcons.withName(PngIcons.salame),
      ),
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Peperoncino",
        icon: PngIcons.withName(PngIcons.peperoncino),
      ),
    ],
  ),
  Pizza(
    name: "Ortolana",
    price: 7.00,
    miniDescription: "Una magia Vegetariana",
    description:
        "La pizza ortolana è una gustosa pizza a base di verdure da servire a chi ama il sapore naturale di ortaggi e funghi associato a filante Mozzarella Santa Lucia. Ideale per pranzi o cene estive, la pizza ortolana può essere gustata tranquillamente fredda, risultando comunque buona.",
    category: FoodCategory.vegetarian,
    image: "assets/images/pizza/Ortolana.png",
    isPopular: true,
    isWhitePizza: true,
    ingredients: [
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Peperone",
        icon: PngIcons.withName(PngIcons.peperone),
      ),
      Ingredient(
        name: "Zucchina",
        icon: PngIcons.withName(PngIcons.zucchina),
      ),
    ],
  ),
  Pizza(
    name: "Francescana",
    price: 7.50,
    miniDescription: "Per veri intenditori !",
    description:
        "La pizza francescana è una gustosa pizza a base di Verdure fresche di stagione, accompagnate da pezzeti di Bacon. Tutto questo a soli 7.50 euro !",
    category: FoodCategory.normal,
    image: "assets/images/pizza/Francescana.png",
    isPopular: true,
    isWhitePizza: false,
    ingredients: [
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Peperone",
        icon: PngIcons.withName(PngIcons.peperone),
      ),
      Ingredient(
        name: "Zucchina",
        icon: PngIcons.withName(PngIcons.zucchina),
      ),
      Ingredient(
        name: "Bacon",
        icon: PngIcons.withName(PngIcons.bacon),
      ),
    ],
  ),
  Pizza(
    name: "Porkys",
    price: 8.00,
    miniDescription: "Per gli amanti della Carne !",
    description:
        "La pizza Porkys rappresenta una vera sfida per il palato ! Ne gusterete ogni singolo pezzo; Il profumo è paradisiaco ! ",
    category: FoodCategory.normal,
    image: "assets/images/pizza/Porkys.png",
    isPopular: true,
    isWhitePizza: true,
    ingredients: [
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Bacon",
        icon: PngIcons.withName(PngIcons.bacon),
      ),
      Ingredient(
        name: "Prosciutto",
        icon: PngIcons.withName(PngIcons.prosciutto),
      ),
    ],
  ),
  Pizza(
    name: "Morbidosa",
    price: 6.50,
    miniDescription: "Pizza bianca mozzarella e patate !",
    description:
        "Volete rimanere leggeri ma avete comunque voglia di Pizza? La morbidosa fa al caso vostro, semplicemente deliziosa !",
    category: FoodCategory.vegetarian,
    image: "assets/images/pizza/Morbidosa.png",
    isPopular: true,
    isWhitePizza: true,
    ingredients: [
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Patata",
        icon: PngIcons.withName(PngIcons.patata),
      ),
    ],
  ),
  Burger(
    meatType: BurgerMeatType.beef,
    name: "Classic",
    price: 6.90,
    description:
        "L'Hamburger di cui non potrete più fare a meno. Prova il cuore di manzo con salsa BBQ, cippola, insalata e pomodoro",
    miniDescription: "Provalo e sorprenditi !",
    image: "assets/images/burger/Classic.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Cipolla",
        icon: PngIcons.withName(PngIcons.onion),
      ),
      Ingredient(
        name: "Manzo",
        icon: PngIcons.withName(PngIcons.manzo),
      ),
    ],
    isPopular: true,
  ),
  Burger(
    meatType: BurgerMeatType.chicken,
    name: "Chicken",
    price: 5.40,
    description:
        "Cuore di pollo, arricchito con maionese e insalta. La semplicità a volte è la scelta migliore !",
    miniDescription: "Burger di Pollo",
    image: "assets/images/burger/Chicken.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Pollo",
        icon: PngIcons.withName(PngIcons.chicken),
      ),
    ],
    isPopular: true,
  ),
  Burger(
    meatType: BurgerMeatType.fish,
    name: "Fish Burger",
    price: 5.20,
    description:
        "L'unico burger di pesce che abbiamo a disposizione. Unico e inimitabile !",
    miniDescription: "Burger di Pesce",
    image: "assets/images/burger/Fish.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Formaggio",
        icon: PngIcons.withName(PngIcons.formaggio),
      ),
      Ingredient(
        name: "Pesce",
        icon: PngIcons.withName(PngIcons.pesce),
      ),
    ],
    isPopular: true,
  ),
  Burger(
    meatType: BurgerMeatType.vegetarian,
    name: "Vegans Burger",
    price: 7.20,
    description:
        "L'hamburger vegano per Eccellenza ! Assolutamente da provare !",
    miniDescription: "Burger Vegano !",
    image: "assets/images/burger/Vegans.png",
    category: FoodCategory.vegan,
    ingredients: [
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Zucchina",
        icon: PngIcons.withName(PngIcons.zucchina),
      ),
    ],
    isPopular: true,
  ),
  Burger(
    meatType: BurgerMeatType.vegetarian,
    name: "Vegetarian",
    price: 6.50,
    description:
        "L'hamburger Vegetariano. Un mix di ortaggi e verdure di inimmaginabile squisitezza. Vieni a provarlo !",
    miniDescription: "Burger Vegetariano",
    image: "assets/images/burger/Vegetarian.png",
    category: FoodCategory.vegetarian,
    ingredients: [
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Patata",
        icon: PngIcons.withName(PngIcons.patata),
      ),
    ],
    isPopular: true,
  ),
  Fries(
    name: "Patatine",
    price: 3.00,
    description:
        "Le patatine fritte sono un Must dei fast foods, impossibile resistergli !",
    miniDescription: "Porzione di Patatine",
    image: "assets/images/fries/Patatine.png",
    category: FoodCategory.vegetarian,
    ingredients: [
      Ingredient(
        name: "Patata",
        icon: PngIcons.withName(PngIcons.patata),
      ),
    ],
    isPopular: true,
  ),
  Fries(
    name: "Mozzarelline",
    price: 3.50,
    description: "Cuore caldo di Mozzarella ! occhio a non scottarsi !",
    miniDescription: "Porzione di Mozzarelline",
    image: "assets/images/fries/Mozzarelline.png",
    category: FoodCategory.vegetarian,
    ingredients: [
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
    ],
    isPopular: true,
  ),
  Fries(
    name: "Nuggets",
    price: 3.50,
    description:
        "Nuggets di pollo per porre fine alle vostre delusioni! soprattutto quelle amorose !",
    miniDescription: "Porzione di Nuggets",
    image: "assets/images/fries/Nuggets.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Pollo",
        icon: PngIcons.withName(PngIcons.chicken),
      ),
    ],
    isPopular: true,
  ),
  Fries(
    name: "Anelli",
    price: 3.50,
    description:
        "Assolutamente da provare i nostri Anelli di Cipolla ! non te ne pentirai !",
    miniDescription: "Porzione di Anelli",
    image: "assets/images/fries/Anelli.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Cipolla",
        icon: PngIcons.withName(PngIcons.onion),
      ),
    ],
    isPopular: true,
  ),
  Fries(
    name: "Olive all'ascolana",
    price: 3.50,
    description:
        "Le olive più buone del mondo! Saresti un pazzo a non provarle !",
    miniDescription: "Olive all'ascolana",
    image: "assets/images/fries/Olive.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Olive",
        icon: PngIcons.withName(PngIcons.olive),
      ),
    ],
    isPopular: true,
  ),
  Salad(
    name: "Classica",
    price: 6.00,
    description: "L'insalata classica soddisfa qualsiasi palato ! una bontà",
    miniDescription: "La più classica",
    image: "assets/images/salad/insClassica.png",
    //vegano è anche vegetariano !!! :O fa gestire
    category: FoodCategory.vegan,
    ingredients: [
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Cipolla",
        icon: PngIcons.withName(PngIcons.onion),
      ),
      Ingredient(
        name: "Carota",
        icon: PngIcons.withName(PngIcons.carota),
      ),
    ],
    isPopular: true,
  ),
  Salad(
    name: "Greca",
    price: 7.00,
    description:
        "Un'insalata molto particolare, adatta a chi è sempre alla ricerca di nuovi sapori !",
    miniDescription: "Un brivido di freschezza",
    image: "assets/images/salad/insGreca.png",
    category: FoodCategory.vegetarian,
    ingredients: [
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Cipolla",
        icon: PngIcons.withName(PngIcons.onion),
      ),
      Ingredient(
        name: "Mozzarella",
        icon: PngIcons.withName(PngIcons.mozzarella),
      ),
      Ingredient(
        name: "Olive",
        icon: PngIcons.withName(PngIcons.olive),
      ),
    ],
    isPopular: true,
  ),
  Salad(
    name: "Chicken Salad",
    price: 7.50,
    description:
        "Un pasto completo, carico di freschezza e di nuove energie per affrontare la giornata !",
    miniDescription: "Per i ver intenditori",
    image: "assets/images/salad/insPollo.png",
    category: FoodCategory.normal,
    ingredients: [
      Ingredient(
        name: "Insalata",
        icon: PngIcons.withName(PngIcons.ingSalad),
      ),
      Ingredient(
        name: "Pomodoro",
        icon: PngIcons.withName(PngIcons.tomato),
      ),
      Ingredient(
        name: "Olive",
        icon: PngIcons.withName(PngIcons.olive),
      ),
      Ingredient(
        name: "Pollo",
        icon: PngIcons.withName(PngIcons.chicken),
      ),
    ],
    isPopular: true,
  ),
];
