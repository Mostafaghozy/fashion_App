import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,

    primaryColor: Colors.yellow,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
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
