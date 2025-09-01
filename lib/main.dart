import 'package:e_commerce/Ui/screens/authScreen.dart';
import 'package:e_commerce/Ui/screens/confirmScreen.dart';
import 'package:e_commerce/Ui/screens/loginScreen.dart';
import 'package:e_commerce/Ui/screens/mainScreen.dart';
import 'package:e_commerce/Ui/screens/signup.dart';
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

      home: const ConfirmScreen(),
    );
  }
}
