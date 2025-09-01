import 'package:e_commerce/Ui/screens/confirmScreen.dart';
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
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.yellow,
        fontFamily: 'Jost',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        primaryColor: Colors.yellow,
        colorScheme: ColorScheme.dark(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          secondary: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'Jost', color: Colors.white),
          bodyMedium: TextStyle(fontFamily: 'Jost', color: Colors.white),
        ),
      ),
      home: const ConfirmScreen(),
    );
  }
}
