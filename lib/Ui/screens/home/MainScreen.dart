import 'package:e_commerce/Ui/screens/home/homeScreen.dart';
import 'package:e_commerce/Ui/screens/search/SearchScreen.dart';
import 'package:e_commerce/Ui/screens/cart/CartScreen.dart';
import 'package:e_commerce/Ui/screens/wishlist/WishlistScreen.dart';
import 'package:e_commerce/Ui/screens/notification/NotificationScreen.dart';
import 'package:e_commerce/Ui/widgets/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
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
