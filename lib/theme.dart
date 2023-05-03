import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0xffB7935F);
  static Color blackColor = const Color(0xff242424);
  static Color whiteColor = const Color(0xffffffff);
  static Color darkPrimary = const Color(0xff141A2E);
  static Color yellowColor = const Color(0xfffAcc1D);

  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: blackColor),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: blackColor),
          displayLarge: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor, unselectedItemColor: whiteColor),
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0));
  static ThemeData nightTheme = ThemeData(
      textTheme: TextTheme(
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: whiteColor),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: whiteColor),
          displayLarge: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: whiteColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellowColor, unselectedItemColor: whiteColor),
      primaryColor: darkPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0));
}
