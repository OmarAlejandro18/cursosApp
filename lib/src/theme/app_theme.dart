import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffeab308);
  static const Color baseBlanca = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: primary,
    ),
  );
}
