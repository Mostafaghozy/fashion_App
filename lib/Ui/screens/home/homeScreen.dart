import 'package:e_commerce/Ui/widgets/CollectionsFilterBar.dart';
import 'package:e_commerce/Ui/widgets/ContainerCustomWidget.dart';
import 'package:e_commerce/Ui/widgets/category/HorizontalProductList.dart';
import 'package:e_commerce/Ui/widgets/category/HorizontalProductCardList.dart';
import 'package:e_commerce/Ui/widgets/category/ProductGridSection.dart';
import 'package:e_commerce/Ui/widgets/WelcomeHeader.dart';
import 'package:e_commerce/Ui/widgets/appbarCustomWidget.dart';
import 'package:e_commerce/Ui/widgets/category/seeAllWidget.dart';
import 'package:e_commerce/data/services/ProductDataService.dart';
import 'package:e_commerce/data/model/productModel.dart';
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
              ),
              SizedBox(height: 20),
              seeAllWidget(text1: 'All Product', text2: 'See all'),

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
              ),

              // Add more sections here if needed
            ],
          ),
        ),
      ),
    );
  }
}
