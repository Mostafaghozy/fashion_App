import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.yellow,
    fontFamily: 'Jost',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.grey,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,

    primaryColor: Colors.yellow,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.yellow,
      onPrimary: Colors.black,
      secondary: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontFamily: 'Jost', color: Colors.white),
      bodyMedium: TextStyle(fontFamily: 'Jost', color: Colors.white),
    ),
  );
}
