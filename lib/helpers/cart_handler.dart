import 'package:flutter/material.dart';
import '../models/food.dart';

class CartProvider with ChangeNotifier {
  double amount = 0;
  Set<Food> foods = {};
  Map<String, int> quantity = {};
  int itemsLength = 0;

  void addItem(Food item, int foodQuantity) {
    for (int i = 0; i < foodQuantity; i++) {
      amount += item.price;
      quantity[item.name] == null
          ? quantity[item.name] = 1
          : quantity[item.name] = quantity[item.name]! + 1;
      itemsLength++;
    }
    foods.add(item);
    notifyListeners();
  }

//per ora si può rimuovere 1 elemento alla volta
  void removeItem(Food item, {int foodQuantity = 1}) {
    amount -= item.price;
    quantity[item.name] = quantity[item.name]! - 1;
    itemsLength--;
    //rimuovo elemento se non ne ho più
    if (quantity[item.name] == 0) {
      foods.remove(item);
    }
    notifyListeners();
  }
}
