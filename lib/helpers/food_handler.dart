import 'package:food_delivery/models/pizza.dart';
import '../food_fake_data/food_fake_data.dart';
import '../models/enums.dart';
import '../models/food.dart';

List<Map<String, dynamic>> filters = [
  {"name": "filter_name", "is_active": false},
];

//void availableFilter() {
//  tipi di filtri:
//  1)basato sulla categoria (vegetariano, vegano, normale) PER TUTTI
//  2) solo per pizza: pizza bianca o rossa
//  3) solo per burger: Tipo di carne(pollo,manzo,pesce,vegetariano)
//}

List<Food> takeFoodByType(FoodType type) =>
    foods.where((food) => food.foodType == type).toList();

List<Food> takeFoodByIndex(int index) => takeFoodByType(FoodType.values[index]);

List<Food> takeFoodByCateogory(FoodCategory category) =>
    foods.where((food) => food.category == category).toList();

List<Food> takePopularFoodByType(FoodType type) =>
    foods.where((food) => food.foodType == type && food.isPopular).toList();

List<Food> takePopularFood() => foods.where((food) => food.isPopular).toList();

List<Food> takeFavoriteFood() =>
    foods.where((food) => food.isFavourite).toList();

List<Food> takeVegetarianFood() => foods
    .where((element) => element.category == FoodCategory.vegetarian)
    .toList();

List<Food> takeVegetarianFoodByType(FoodType type) => foods
    .where((element) =>
        element.foodType == type && element.category == FoodCategory.vegetarian)
    .toList();

List<Food> takeWhitePizzas() =>
    foods.where((element) => element is Pizza && element.isWhitePizza).toList();
