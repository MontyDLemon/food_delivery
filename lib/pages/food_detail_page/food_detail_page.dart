import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/cart_handler.dart';
import 'package:food_delivery/models/ingredient.dart';
import 'package:food_delivery/theme.dart';

import '../../models/food.dart';
import 'component/quantity_handler.dart';
import 'component/rounded_container.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 0;
  //remember food.isFavorite field
  late final bool userChangeFavorite;

  @override
  void initState() {
    super.initState();
    userChangeFavorite = widget.food.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    //in questo modo fixo: se andavo indietro con il tasto android non mi ribuildava la page precedente !
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pop(userChangeFavorite != widget.food.isFavourite);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildFab(context),
      ),
    );
  }

  _buildAppBar(BuildContext context) => AppBar(
        leading: InkWell(
          //if user changed favorite item -> rebuild previous page to see modify
          onTap: () => Navigator.of(context)
              .pop(userChangeFavorite != widget.food.isFavourite),
          child: const RoundedContainer(
            color: AppColor.transparentColor,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        title: //food name
            Text(
          widget.food.name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          InkWell(
            onTap: () {
              widget.food.isFavourite = !widget.food.isFavourite;
              setState(() {});
            },
            child: RoundedContainer(
              color: AppColor.primaryColor,
              child: Icon(
                widget.food.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

  _buildBody(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 11, child: _buildDetailsImage()),
                Flexible(
                  child: Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                //lista ingredienti
                Expanded(
                  flex: 2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.food.ingredients
                        .map((ingredient) =>
                            _buildIngredient(context, ingredient))
                        .toList(),
                  ),
                ),
                const SizedBox(height: kToolbarHeight / 2),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Details",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 24.0),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.food.description,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ]),
        ),
      );

  Row _buildDetailsImage() => Row(
        children: [
          //food price and quantity
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food price
                Text(
                  "\$ ${widget.food.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //food score + icon star
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      "4.9",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                //padding height
                const SizedBox(height: kToolbarHeight),
                Text(
                  "Quantity",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                //2 bottoni e la quantità
                QuantityHandler(
                  onBtnTapped: (val) => quantity = val,
                )
              ],
            ),
          ),
          //food image
          Expanded(
            flex: 6,
            child: Image.asset(
              widget.food.image,
              fit: BoxFit.fill,
            ),
          ),
        ],
      );

  Widget _buildIngredient(BuildContext context, Ingredient ingredient) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/icons/ingredients/${ingredient.name}.png"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ingredient.name,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  _buildFab(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
          onPressed: () {
            if (quantity > 0) {
              context.read<CartProvider>().addItem(widget.food, quantity);
              //show SnackBar to tell user "added to cart" :P
              ScaffoldMessenger.of(context)
                  .showSnackBar(_buildSnackBar(context));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(_buildSnackBar(context, haveError: true));
            }
          },
          child: const Text("Add to cart"),
        ),
      );

  SnackBar _buildSnackBar(BuildContext context, {bool haveError = false}) =>
      SnackBar(
        //on tap => open cartPage
        backgroundColor: haveError ? Colors.red : AppColor.primaryColor,
        duration: const Duration(milliseconds: 1500),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              haveError
                  ? "Error: Please Choose Quantity"
                  : "${quantity}x ${widget.food.name} Added To Cart !",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!haveError)
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  //pop perchè la pagina precedente deve avere un valore
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    "cart",
                    (route) => false,
                  );
                },
                child: const Text("Open Cart"),
              )
          ],
        ),
      );
}
