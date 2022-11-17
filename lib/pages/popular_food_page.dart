import 'package:flutter/material.dart';
import 'package:food_delivery/models/enums.dart';
import 'package:food_delivery/router.dart';

import '../common_widgets/food_box.dart';
import '../helpers/food_handler.dart';
import '../theme.dart';
import 'food_detail_page/component/rounded_container.dart';

//Show popular products

class PopularFoodPage extends StatelessWidget {
  final FoodType currentFoodType;
  final String foodTypeName;
  PopularFoodPage({
    Key? key,
    required this.currentFoodType,
  })  : foodTypeName = getFoodType(currentFoodType),
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      );

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        leading: InkWell(
          //if user changed favorite item -> rebuild previous page to see modify
          onTap: () => Navigator.of(context).pop(),
          child: const RoundedContainer(
            color: AppColor.transparentColor,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Popular $foodTypeName",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      );

  _buildBody(BuildContext context) => SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(5.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          children: takePopularFoodByType(currentFoodType)
              .map((food) => FoodBox(
                    food: food,
                    onNavigate: () => Navigator.of(context).pushNamed(
                        FoodDeliveryRouter.detailPage,
                        arguments: food),
                  ))
              .toList(),
        ),
      );
}
