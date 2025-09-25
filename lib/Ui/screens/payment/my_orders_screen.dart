import 'package:e_commerce/Ui/screens/home/MainScreen.dart';
import 'package:e_commerce/Ui/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/Ui/widgets/order/orderCard.dart';
import 'package:e_commerce/Ui/widgets/order/filterButtonAtWidget.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white54),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              const Text(
                'My orders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              // Filter row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterButton(
                      text: 'All',
                      index: 0,
                      selectedIndex: _selectedFilterIndex,
                      onTap: (index) =>
                          setState(() => _selectedFilterIndex = index),
                    ),
                    FilterButton(
                      text: 'To pay',
                      index: 1,
                      selectedIndex: _selectedFilterIndex,
                      onTap: (index) =>
                          setState(() => _selectedFilterIndex = index),
                    ),
                    FilterButton(
                      text: 'To ship',
                      index: 2,
                      selectedIndex: _selectedFilterIndex,
                      onTap: (index) =>
                          setState(() => _selectedFilterIndex = index),
                    ),
                    FilterButton(
                      text: 'To receive',
                      index: 3,
                      selectedIndex: _selectedFilterIndex,
                      onTap: (index) =>
                          setState(() => _selectedFilterIndex = index),
                    ),
                  ],
                ),
              ),

              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [OrderCard(context), OrderCard(context)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}
