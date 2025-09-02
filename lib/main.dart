import 'package:e_commerce/Ui/screens/auth/confirmScreen.dart';
import 'package:e_commerce/Ui/screens/auth/mainScreen.dart';
import 'package:e_commerce/Ui/screens/home/homeScreen.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fashion App",
      themeMode: ThemeMode.dark,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: HomeScreen(),
    );
  }
}
