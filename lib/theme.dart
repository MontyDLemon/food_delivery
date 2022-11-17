import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: AppColor.primaryColor,
        backgroundColor: AppColor.transparentColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0.0),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.primaryColor,
        ),
        iconTheme: const IconThemeData(
          size: 24.0,
          color: AppColor.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: AppColor.primaryColor,
                elevation: 25.0,
                shadowColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),),
        textTheme: const TextTheme(
          //testo per descrizioni
          bodyText1: TextStyle(
            color: AppColor.descriptionColor,
            fontWeight: FontWeight.normal,
          ),
          //testo per i titoli
          bodyText2: TextStyle(
            color: AppColor.titleTextColor,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          //testo per i sottotitoli
          headline1: TextStyle(
            color: AppColor.titleTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      );
}

extension AppColor on Colors {
  //green
  static const primaryColor = Color(0xFF34C759);
  //light grey for text on description
  static const descriptionColor = Color(0XFF9E9E9E);
  //black for Title text
  static const titleTextColor = Color(0xFF061737);
  //transparent
  static const transparentColor = Color(0xFFC4C4C4);
  //color light for drawing background
  static const figureBckColor = Color(0xFFFAFAFA);
}
