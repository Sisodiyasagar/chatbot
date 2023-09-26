import 'package:chatgpt/constants/constants.dart';
import 'package:flutter/material.dart';

class Apptheme{
  static ThemeData lighttheme=ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      color: Colors.brown,
    ),
  );
  static ThemeData darktheme=ThemeData(
    brightness: Brightness.dark
  );
}