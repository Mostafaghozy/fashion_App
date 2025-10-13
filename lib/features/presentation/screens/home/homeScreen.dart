import 'package:e_commerce/features/presentation/widgets/CartNotificationBottomSheet.dart';
import 'package:e_commerce/features/presentation/widgets/CollectionsFilterBar.dart';
import 'package:e_commerce/features/presentation/widgets/ContainerCustomWidget.dart';
import 'package:e_commerce/features/presentation/widgets/WelcomeHeader.dart';
import 'package:e_commerce/features/presentation/widgets/appbarCustomWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/HorizontalProductCardList.dart';
import 'package:e_commerce/features/presentation/widgets/category/HorizontalProductList.dart';
import 'package:e_commerce/features/presentation/widgets/category/ProductGridSection.dart';
import 'package:e_commerce/features/presentation/widgets/category/seeAllWidget.dart';
import 'package:e_commerce/features/presentation/screens/home/AllProductScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/MainScreen.dart';

import 'package:e_commerce/features/data/services/ProductDataService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void toggleFavorite(String productId) {
    setState(() {
      ProductDataService.toggleFavorite(productId);
    });
  }

  void addToCart(String productName) {
    // Show the cart notification
    CartNotificationBottomSheet.show(
      context,
      productName: productName,
      onViewCart: () {
        // Navigate to cart screen (index 2 in bottom nav)
        // We need to navigate to MainScreen and set the cart tab
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainScreen(initialIndex: 2)),
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
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(),
              ContainerCustomWidget(),
              SizedBox(height: 10),
              CollectionsFilterBar(),
              SizedBox(height: 15),
              seeAllWidget(text1: 'All collections', text2: 'See all'),
              SizedBox(height: 20),
              // Horizontal Product List
              ProductDataService.getFavoriteProducts().isEmpty
                  ? Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 60,
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: 12),
                            Text(
                              'No products available',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : HorizontalProductList(
                      products: ProductDataService.getFavoriteProducts(),
                      onToggleFavorite: toggleFavorite,
                      onAddToCart: addToCart,
                    ),
              SizedBox(height: 20),
              seeAllWidget(text1: 'New arrivals', text2: 'See all'),
              SizedBox(height: 20),

              // First Row - Horizontal Product Cards Section
              HorizontalProductCardList(
                products: ProductDataService.getHorizontalProducts(),
                onCardPressed: (product) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening ${product.title}')),
                  );
                },
                onAddToCart: addToCart,
              ),

              SizedBox(height: 2),

              // Second Row - Horizontal Product Cards Section
              HorizontalProductCardList(
                products: ProductDataService.getHorizontalProducts2(),
                onCardPressed: (product) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening ${product.title}')),
                  );
                },
                onAddToCart: addToCart,
              ),
              SizedBox(height: 20),
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

              SizedBox(height: 15),

              // Grid Products Section with 2 cards per row
              ProductGridSection(
                products: ProductDataService.getGridProducts(),
                onToggleFavorite: toggleFavorite,
                onCardPressed: (product) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening ${product.title}')),
                  );
                },
                onAddToCart: addToCart,
              ),

              // Add more sections here if needed
            ],
          ),
        ),
      ),
    );
  }
}
