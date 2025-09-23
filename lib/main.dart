import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/Ui/screens/home/MainScreen.dart';
import 'package:e_commerce/Ui/screens/payment/CreditCardScreen.dart';
import 'package:e_commerce/Ui/screens/payment/PaymentMethodsScreen.dart';
import 'package:e_commerce/Ui/screens/payment/PaymentScreen.dart';
import 'package:e_commerce/core/theme.dart';
import 'package:e_commerce/test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  // DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
  MyApp(), // Wrap your app
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "Fashion App",
      themeMode: ThemeMode.system,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: PaymentMethodsPage(),
    );
  }
}
