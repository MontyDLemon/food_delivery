import 'package:flutter/material.dart';
import 'package:food_delivery/constant/png_icons.dart';
import 'package:food_delivery/helpers/cart_handler.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page/home_page.dart';
import 'package:food_delivery/pages/notify_page.dart';
import 'package:food_delivery/router.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  const MainPage({
    Key? key,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: width < 700 ? _buildNavBar(context) : null,
      endDrawer: width > 700 ? _buildEndDrawer(context) : null,
      floatingActionButton: width < 700 ? _buildFab(context) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _buildAppBar(BuildContext context) => AppBar(
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipOval(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/avatar.png"),
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "MontyD_Lemon ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.grid_view,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      );

  _buildBody(BuildContext context) {
    switch (currentIndex) {
      case 1:
        return const NotifyPage();

      case 2:
        return const FavoritePage();

      case 3:
        return const CartPage();

      default:
        return const HomePage();
    }
  }

  _buildNavBar(BuildContext context) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 10.0,
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: currentIndex == 0
                  ? const Icon(Icons.home)
                  : PngIcons.withName(PngIcons.home),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(currentIndex == 1
                  ? Icons.notifications
                  : Icons.notifications_none),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            const SizedBox(width: 32.0),
            IconButton(
              icon: Icon(
                currentIndex == 2 ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            Consumer<CartProvider>(builder: (context, cartProv, _) {
              if (cartProv.foods.isEmpty) {
                return IconButton(
                  icon: currentIndex == 3
                      ? const Icon(Icons.shopping_cart)
                      : PngIcons.withName(PngIcons.cart, size: 32.0),
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                );
              }
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    icon: currentIndex == 3
                        ? const Icon(Icons.shopping_cart)
                        : PngIcons.withName(PngIcons.cart, size: 32.0),
                    onPressed: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  ),
                  Positioned(
                    top: -5.0,
                    right: -5.0,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      child: FittedBox(
                        child: Text(
                          "${cartProv.itemsLength}",
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      );

  _buildFab(BuildContext context) => FloatingActionButton(
        elevation: 10.0,
        //open menu
        onPressed: () =>
            Navigator.of(context).pushNamed(FoodDeliveryRouter.menu),
        child: const Icon(Icons.restaurant_menu, color: Colors.white),
      );

  _buildEndDrawer(BuildContext context) {
    return Drawer(
      child: Column(children: [
        IconButton(
          icon: currentIndex == 0
              ? const Icon(Icons.home)
              : PngIcons.withName(PngIcons.home),
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
        ),
        IconButton(
          icon: Icon(currentIndex == 1
              ? Icons.notifications
              : Icons.notifications_none),
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          },
        ),
        const SizedBox(width: 32.0),
        IconButton(
          icon: Icon(
            currentIndex == 2 ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
        ),
        _buildFab(context),
        Consumer<CartProvider>(builder: (context, cartProv, _) {
          if (cartProv.foods.isEmpty) {
            return IconButton(
              icon: currentIndex == 3
                  ? const Icon(Icons.shopping_cart)
                  : PngIcons.withName(PngIcons.cart, size: 32.0),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            );
          }
          return Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: currentIndex == 3
                    ? const Icon(Icons.shopping_cart)
                    : PngIcons.withName(PngIcons.cart, size: 32.0),
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
              ),
              Positioned(
                top: -5.0,
                right: -5.0,
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${cartProv.itemsLength}",
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ]),
    );
  }
}
