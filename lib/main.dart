import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/cart_handler.dart';
import 'package:food_delivery/router.dart';
import 'package:food_delivery/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Food Delivery App by MontyD_Lemon ',
        theme: AppTheme.appTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: FoodDeliveryRouter.onGenerateRoute,
      ),
    );
  }
}



//todo: cambiare tutto in italiano
