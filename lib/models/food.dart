import '../models/enums.dart';

import 'ingredient.dart';

abstract class Food {
  final String name;
  final double price;
  final String description;
  final String miniDescription;
  final String image;
//pizza - fries- hamburger and so on
  final FoodType foodType;
  //vegetarian - vegans -
  final FoodCategory category;
  final List<Ingredient> ingredients;
  final bool isPopular;
  bool isFavourite;

  Food({
    required this.name,
    required this.price,
    required this.description,
    required this.miniDescription,
    required this.image,
    required this.foodType,
    required this.category,
    required this.ingredients,
    required this.isPopular,
    this.isFavourite = false,
  });
}
