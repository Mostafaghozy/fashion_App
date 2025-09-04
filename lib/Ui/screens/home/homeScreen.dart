import 'package:e_commerce/Ui/screens/auth/loginScreen.dart';
import 'package:e_commerce/Ui/widgets/CollectionsFilterBar.dart';
import 'package:e_commerce/Ui/widgets/ContainerCustomWidget.dart';
import 'package:e_commerce/Ui/widgets/ProductCardComponent.dart';
import 'package:e_commerce/Ui/widgets/appbarCustomWidget.dart';
import 'package:e_commerce/model/productModel.dart';
// Add this import for ProductCard
// Adjust path as needed
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> favoriteProducts = [
    Product(
      id: '1',
      title: 'Green Long sleeve shirt',
      price: 25.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: true,
    ),
    Product(
      id: '2',
      title: 'Stylish Winter Coat',
      price: 45.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: true,
    ),
    Product(
      id: '3',
      title: 'Summer Dress',
      price: 35.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
    Product(
      id: '4',
      title: 'Men’s wear',
      price: 20.00,
      imageUrl: 'assets/modelMan1.png',
      isFavorite: false,
    ),
    Product(
      id: '5',
      title: 'Men’s wear',
      price: 55.00,
      imageUrl: 'assets/modelMan2.png',
      isFavorite: false,
    ),
  ];

  void toggleFavorite(String productId) {
    setState(() {
      final index = favoriteProducts.indexWhere(
        (product) => product.id == productId,
      );
      if (index != -1) {
        favoriteProducts[index] = Product(
          id: favoriteProducts[index].id,
          title: favoriteProducts[index].title,
          price: favoriteProducts[index].price,
          imageUrl: favoriteProducts[index].imageUrl,
          isFavorite: !favoriteProducts[index].isFavorite,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome", style: TextStyle(fontSize: 18)),
              Text(
                "zimro store!",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
              ContainerCustomWidget(),
              SizedBox(height: 10),
              CollectionsFilterBar(),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "All collections",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ()),
                      // );
                    },
                    child: Row(
                      children: [
                        Text("See all"),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios_rounded, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Horizontal Product List
              favoriteProducts.isEmpty
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
                  : Container(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];
                          return Container(
                            margin: EdgeInsets.only(right: 15),
                            child: ProductCard(
                              imageUrl: product.imageUrl,
                              title: product.title,
                              price: product.price,
                              isFavorite: product.isFavorite,
                              width: 180,
                              height: 280,
                              onFavoritePressed: () =>
                                  toggleFavorite(product.id),
                              onCardPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Opening ${product.title}'),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(height: 20),
              // Add more sections here if needed
            ],
          ),
        ),
      ),
    );
  }
}
