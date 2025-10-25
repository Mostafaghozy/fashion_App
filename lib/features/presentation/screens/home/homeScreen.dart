import 'package:e_commerce/features/presentation/widgets/CartNotificationBottomSheet.dart';
import 'package:e_commerce/features/presentation/widgets/home/CollectionsFilterBar.dart';
import 'package:e_commerce/features/presentation/widgets/home/ContainerCustomWidget.dart';
import 'package:e_commerce/features/presentation/widgets/home/CustomListView.dart';
import 'package:e_commerce/features/presentation/widgets/home/HomeFilterSheet.dart';
import 'package:e_commerce/features/presentation/widgets/home/WelcomeHeader.dart';
import 'package:e_commerce/features/presentation/widgets/home/appbarCustomWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/HorizontalProductCardList.dart';
import 'package:e_commerce/features/presentation/widgets/home/CardItem.dart';

import 'package:e_commerce/features/presentation/widgets/home/seeAllWidget.dart';
import 'package:e_commerce/features/presentation/screens/home/AllProductScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/Root.dart';

import 'package:e_commerce/features/data/services/ProductDataService.dart';
import 'package:e_commerce/features/presentation/widgets/home/CustomFilterWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addToCart(String productName) {
    // Show the cart notification
    CartNotificationBottomSheet.show(
      context,
      productName: productName,
      onViewCart: () {
        // Navigate to cart screen (index 2 in bottom nav)
        // We need to navigate to MainScreen and set the cart tab
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RootScreen(initialIndex: 2)),
          (route) => false,
        );
      },
      onCheckOrder: () {
        // Navigate to orders or profile screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Check order functionality')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(),
              ContainerCustomWidget(),
              Gap(10),
              CustomFilterWidget(),
              Gap(15),
              seeAllWidget(text1: 'All collections', text2: 'See all'),
              Gap(20),
              CustomListView(),
              Gap(20),
              seeAllWidget(text1: 'New arrivals', text2: 'See all'),
              Gap(20),
              HorizontalProductCardList(),

              Gap(20),
              seeAllWidget(
                text1: 'All Product',
                text2: 'See all',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllProductScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
