import 'package:flutter/material.dart';

class PngIcons {
  //ingredienti
  static const tomato = "assets/icons/ingredients/Pomodoro.png";
  static const ingSalad = "assets/icons/ingredients/Insalata.png";
  static const mozzarella = "assets/icons/ingredients/Mozzarella.png";
  static const aglio = "assets/icons/ingredients/Aglio.png";
  static const origano = "assets/icons/ingredients/Origano.png";
  static const salame = "assets/icons/ingredients/Salame.png";
  static const peperoncino = "assets/icons/ingredients/Peperoncino.png";
  static const peperone = "assets/icons/ingredients/Peperone.png";
  static const zucchina = "assets/icons/ingredients/Zucchina.png";
  static const onion = "assets/icons/ingredients/Onion.png";
  static const manzo = "assets/icons/ingredients/Manzo.png";
  static const bacon = "assets/icons/ingredients/Bacon.png";
  static const chicken = "assets/icons/ingredients/Pollo.png";
  static const prosciutto = "assets/icons/ingredients/Prosciutto.png";
  static const patata = "assets/icons/ingredients/Patata.png";
  static const formaggio = "assets/icons/ingredients/Formaggio.png";
  static const pesce = "assets/icons/ingredients/Pesce.png";
  static const olive = "assets/icons/ingredients/Olive.png";
  static const carota = "assets/icons/ingredients/Carota.png";
  //icone di base
  static const cart = "assets/icons/cart.png";
  static const home = "assets/icons/home.png";
  static const search = "assets/icons/search.png";
  //food type
  static const burger = "assets/icons/burger.png";
  static const cocktail = "assets/images/cocktail.png";
  static const drink = "assets/images/drink.png";
  static const fries = "assets/images/fries.png";
  static const pizza = "assets/images/pizza.png";
  static const salad = "assets/images/salad.png";

  static ImageIcon withName(String path, {double size = 24, Color? color}) =>
      ImageIcon(
        AssetImage(path),
        size: size,
        color: color,
      );
}
