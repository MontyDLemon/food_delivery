import 'package:flutter/material.dart';
import 'package:food_delivery/models/enums.dart';
import 'package:food_delivery/pages/home_page/components/food_type_box.dart';
import 'package:food_delivery/responsive_widget/responsive_widget.dart';
import 'package:food_delivery/router.dart';
import '../../common_widgets/food_box.dart';
import '../../helpers/food_handler.dart';
import '../../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FoodType _selectedFoodType = FoodType.pizza;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get Your Food",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Delivered!",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: kToolbarHeight / 2),
          Text(
            "Categories",
            style: Theme.of(context).textTheme.headline1,
          ),
          //food type
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: FoodType.values
                  .map((type) => FoodTypeBox(
                        foodType: type,
                        isSelected: _selectedFoodType == type,
                        onItemSelected: () =>
                            setState(() => _selectedFoodType = type),
                      ))
                  .toList(),
            ),
          ),
          //popular now - ViewAll
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Now",
                style: Theme.of(context).textTheme.headline1,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  FoodDeliveryRouter.popularPage,
                  arguments: _selectedFoodType,
                ),
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          //list of popular products (prodotti in sconto - prodotti consigliati)
          Expanded(
            child: SizedBox(
                child: ResponsiveWidget(
              mobileWidget: ListView(
                scrollDirection: Axis.horizontal,
                children: getChildren(),
              ),
              tabletWidget: _buildGridView(context, 2),
              webWidget: _buildGridView(context, 3),
            )),
          ),
        ],
      ),
    );
  }

  _buildGridView(BuildContext context, int crossAxisCount) => GridView(
        padding: const EdgeInsets.all(5.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        children: getChildren(),
      );

  List<Widget> getChildren() => takePopularFoodByType(_selectedFoodType)
      .map((food) => FoodBox(
            food: food,
            onNavigate: () => Navigator.of(context).pushNamed(
              "detail",
              arguments: food,
            ),
          ))
      .toList();
}
