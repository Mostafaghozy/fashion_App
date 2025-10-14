import 'package:e_commerce/features/presentation/screens/cart/OrderCartScreen.dart';
import 'package:e_commerce/features/presentation/screens/cart/emptyScreen.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrderCartScreen());
  }
}
