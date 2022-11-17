import 'package:flutter/material.dart';
import '../common_widgets/food_box.dart';
import '../helpers/food_handler.dart';
import '../models/food.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final List<Food> _favoriteFood = takeFavoriteFood();
    return SafeArea(
        child: _favoriteFood.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/no_favorite_food.jpg"),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: Text("Haven't any preferences?")),
                  const Spacer()
                ],
              )
            : GridView(
                padding: const EdgeInsets.all(5.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                children: _favoriteFood
                    .map((food) => FoodBox(
                          food: food,
                          onNavigate: () async {
                            //rebuild when user navigate.pop

                            final bool? _rebuildPage =
                                await Navigator.of(context).pushNamed("detail",
                                    arguments: food) as bool?;
                            //if user changed favorite item, this page will rebuild !
                            //rebuild only if user change that value ! :P
                            if (_rebuildPage != null && _rebuildPage) {
                              setState(() {});
                            }
                          },
                        ))
                    .toList(),
              ));
  }
}
