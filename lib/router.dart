import 'package:flutter/material.dart';
import 'package:food_delivery/models/enums.dart';
import 'package:food_delivery/pages/food_detail_page/food_detail_page.dart';
import 'package:food_delivery/pages/main_page.dart';
import 'package:food_delivery/pages/menu_page/menu_page.dart';
import 'package:food_delivery/pages/popular_food_page.dart';

import 'models/food.dart';

class FoodDeliveryRouter {
  static const mainPage = 'main';
  static const detailPage = 'detail';
  static const cart = 'cart';
  static const popularPage = "pop";
  static const menu = "menu";
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case mainPage:
        return MaterialPageRoute<void>(
          builder: (_) => const MainPage(),
        );
      case cart:
        return MaterialPageRoute<void>(
          builder: (_) => const MainPage(
            initialIndex: 3,
          ),
        );
      case popularPage:
        return MaterialPageRoute<void>(
          builder: (_) => PopularFoodPage(
            currentFoodType: routeSettings.arguments as FoodType,
          ),
        );
      case detailPage:
        return MaterialPageRoute<void>(
          builder: (_) => FoodDetailPage(
            food: routeSettings.arguments as Food,
          ),
        );
      case menu:
        return MaterialPageRoute<void>(
          builder: (_) => const MenuPage(),
        );
      default: //per ora entra su login
        return MaterialPageRoute<void>(
          builder: (_) => const MainPage(),
        );
    }
  }
}
