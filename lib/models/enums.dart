enum FoodType {
  pizza,
  burger,
  fries,
  salad,
  dessert,
  drink,
  cocktail,
}

//get "FoodType.pizza", -> return "pizza"
String getFoodType(FoodType type) => type.toString().substring(9);

/*
extension FoodTypeExtension on FoodType {
  String get foodType {
    switch (this) {
      case FoodType.pizza:
        return _getFoodType(FoodType.pizza);
      case FoodType.burger:
        return _getFoodType(FoodType.burger);
      case FoodType.fries:
        return _getFoodType(FoodType.fries);
      case FoodType.salad:
        return _getFoodType(FoodType.salad);
      case FoodType.dessert:
        return _getFoodType(FoodType.dessert);
      case FoodType.drink:
        return _getFoodType(FoodType.drink);
      case FoodType.cocktail:
        return _getFoodType(FoodType.cocktail);
    }
  }

*/

//FILTERS

enum FoodCategory {
  vegetarian,
  vegan,
  normal,
}

enum BurgerMeatType {
  beef,
  chicken,
  fish,
  vegetarian,
}
