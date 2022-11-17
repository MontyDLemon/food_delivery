import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/cart_handler.dart';
import 'package:food_delivery/models/food.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Set<Food> _cartFoods = CartHandler.foods;
    return Consumer<CartProvider>(
      builder: (context, cartProv, _) {
        if (cartProv.foods.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/empty.jpg"),
                    ),
                  ),
                ),
              ),
              const Expanded(child: Text("Cart is Empty")),
              const Spacer()
            ],
          );
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //list with orders in the cart
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              children: cartProv.foods
                  .map((food) => _buildFoodBox(context, food, cartProv))
                  .toList(),
            ),
          ),
          //button for order products
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Amount: \$ ${cartProv.amount.toStringAsFixed(2)}"),
                  const Spacer(),
                  const Text("Order "),
                  const Icon(Icons.shopify)
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }

  Widget _buildFoodBox(BuildContext context, Food food, CartProvider cart) {
    final int foodQuantity = cart.quantity[food.name]!;
    final double foodAmount = food.price * foodQuantity;
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: ListTile(
        leading: Image.asset(food.image),
        title: Text(
          food.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${foodAmount.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: AppColor.transparentColor, fontSize: 22.0),
            ),
            Text(
              "${cart.quantity[food.name]}x",
              style: const TextStyle(
                  color: AppColor.transparentColor, fontSize: 22.0),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: AppColor.primaryColor,
          ),
          //remove element from the cart
          onPressed: () {
            //CartHandler.removeItem(food);
            cart.removeItem(food);
          },
        ),
      ),
    );
  }
}
