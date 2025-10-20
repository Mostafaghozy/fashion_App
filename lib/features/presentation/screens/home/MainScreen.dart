import 'package:e_commerce/features/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/features/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce/features/presentation/screens/search/SearchScreen.dart';
import 'package:e_commerce/features/presentation/screens/cart/CartScreen.dart';
import 'package:e_commerce/features/presentation/screens/wishlist/WishListScreen.dart';
import 'package:e_commerce/features/presentation/screens/notification/NotificationScreen.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    MyCartScreen(),
    WishlistScreen(),
    NotificationScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
