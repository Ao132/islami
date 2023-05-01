import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0xffB7935F);
  static Color blackColor = const Color(0xff242424);
  static Color whiteColor = const Color(0xffffffff);

  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(titleSmall:TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: blackColor) ,titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: blackColor) ,displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor
      ),
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, centerTitle: true, elevation: 0));
  static ThemeData nightTheme = ThemeData();
}
