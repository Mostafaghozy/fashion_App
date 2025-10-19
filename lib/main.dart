import 'package:e_commerce/features/presentation/screens/cart/CartScreen.dart';
import 'package:e_commerce/features/presentation/screens/cart/CheckoutScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/AllProductScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/MainScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce/features/presentation/screens/payment/DeliveryStatusScreen.dart';
import 'package:e_commerce/features/presentation/screens/payment/PaymentSuccess.dart';
import 'package:e_commerce/features/presentation/screens/payment/my_orders_screen.dart';
import 'package:e_commerce/features/presentation/screens/search/SearchScreen.dart';
import 'package:e_commerce/features/presentation/screens/wishlist/WishlistScreen.dart';

import 'package:e_commerce/core/theme.dart';
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
      home: DeliveryStatusScreen(),
    );
  }
}
