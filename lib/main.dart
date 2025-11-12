import 'package:e_commerce/core/api_keys.dart';
import 'package:e_commerce/features/presentation/screens/cart/CartScreen.dart';
import 'package:e_commerce/features/presentation/screens/cart/CheckoutScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/AllProductScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/Root.dart';
import 'package:e_commerce/features/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce/features/presentation/screens/notification/NotificationScreen.dart';
import 'package:e_commerce/features/presentation/screens/payment/PaymentSuccess.dart';
import 'package:e_commerce/features/presentation/screens/payment/my_orders_screen.dart';
import 'package:e_commerce/features/presentation/screens/search/SearchScreen.dart';
import 'package:e_commerce/features/presentation/screens/wishlist/WishListScreen.dart';

import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/core/theme.dart';
import 'package:e_commerce/test.json';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "Fashion App",
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.dark,
      home: RootScreen(),
    );
  }
}
 // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(),
      // ),