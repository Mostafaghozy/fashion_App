import 'package:e_commerce/Ui/widgets/CollectionsFilterBar.dart';
import 'package:e_commerce/Ui/widgets/ContainerCustomWidget.dart';
import 'package:e_commerce/Ui/widgets/ProductCardComponent.dart';
import 'package:e_commerce/Ui/widgets/ProductCardHorizontal.dart';
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
      category: 'Women\'s wear',
      price: 25.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: true,
    ),
    Product(
      id: '2',
      title: 'Stylish Winter Coat',
      category: 'Women\'s wear',
      price: 45.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: true,
    ),
    Product(
      id: '3',
      title: 'Summer Dress',
      category: 'Women\'s wear',
      price: 35.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
    Product(
      id: '4',
      title: 'Men\'s wear',
      category: 'Men\'s wear',
      price: 20.00,
      imageUrl: 'assets/modelMan1.png',
      isFavorite: false,
    ),
    Product(
      id: '5',
      title: 'Men\'s wear',
      category: 'Men\'s wear',
      price: 55.00,
      imageUrl: 'assets/modelMan2.png',
      isFavorite: false,
    ),
  ];

  // New horizontal product list matching the image design
  List<Product> horizontalProducts = [
    Product(
      id: '6',
      title: 'Cotton long sleeve jacket',
      category: 'Women\'s wear',
      price: 26.00,
      imageUrl: 'assets/girl_h1.png',
      isFavorite: true,
    ),
    Product(
      id: '7',
      title: 'Elegant evening dress',
      category: 'Women\'s wear',
      price: 45.00,
      imageUrl: 'assets/girl_h2.png',
      isFavorite: false,
    ),
    Product(
      id: '8',
      title: 'Casual summer top',
      category: 'Women\'s wear',
      price: 22.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: true,
    ),
  ];

  // Second row of horizontal products
  List<Product> horizontalProducts2 = [
    Product(
      id: '9',
      title: 'Classic denim jacket',
      category: 'Men\'s wear',
      price: 35.00,
      imageUrl: 'assets/girl_h2.png',
      isFavorite: false,
    ),
    Product(
      id: '10',
      title: 'Formal business shirt',
      category: 'Men\'s wear',
      price: 28.00,
      imageUrl: 'assets/girl_h1.png',
      isFavorite: true,
    ),
    Product(
      id: '11',
      title: 'Trendy hoodie',
      category: 'Men\'s wear',
      price: 42.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
  ];

  void toggleFavorite(String productId) {
    setState(() {
      // Check in favoriteProducts
      final favoriteIndex = favoriteProducts.indexWhere(
        (product) => product.id == productId,
      );
      if (favoriteIndex != -1) {
        favoriteProducts[favoriteIndex] = Product(
          id: favoriteProducts[favoriteIndex].id,
          title: favoriteProducts[favoriteIndex].title,
          category: favoriteProducts[favoriteIndex].category,
          price: favoriteProducts[favoriteIndex].price,
          imageUrl: favoriteProducts[favoriteIndex].imageUrl,
          isFavorite: !favoriteProducts[favoriteIndex].isFavorite,
        );
      }

      // Check in horizontalProducts
      final horizontalIndex = horizontalProducts.indexWhere(
        (product) => product.id == productId,
      );
      if (horizontalIndex != -1) {
        horizontalProducts[horizontalIndex] = Product(
          id: horizontalProducts[horizontalIndex].id,
          title: horizontalProducts[horizontalIndex].title,
          category: horizontalProducts[horizontalIndex].category,
          price: horizontalProducts[horizontalIndex].price,
          imageUrl: horizontalProducts[horizontalIndex].imageUrl,
          isFavorite: !horizontalProducts[horizontalIndex].isFavorite,
        );
      }

      // Check in horizontalProducts2
      final horizontalIndex2 = horizontalProducts2.indexWhere(
        (product) => product.id == productId,
      );
      if (horizontalIndex2 != -1) {
        horizontalProducts2[horizontalIndex2] = Product(
          id: horizontalProducts2[horizontalIndex2].id,
          title: horizontalProducts2[horizontalIndex2].title,
          category: horizontalProducts2[horizontalIndex2].category,
          price: horizontalProducts2[horizontalIndex2].price,
          imageUrl: horizontalProducts2[horizontalIndex2].imageUrl,
          isFavorite: !horizontalProducts2[horizontalIndex2].isFavorite,
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
          padding: const EdgeInsets.all(8),
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
              Row(
                children: [
                  Text(
                    "New arrivals",
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

              // First Row - Horizontal Product Cards Section
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  itemCount: horizontalProducts.length,
                  itemBuilder: (context, index) {
                    final product = horizontalProducts[index];
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      child: ProductCardHorizontal(
                        imageUrl: product.imageUrl,
                        title: product.title,
                        category: product.category,
                        price: product.price,
                        isFavorite: product.isFavorite,
                        width: 350,
                        height: 90,

                        onCardPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Opening ${product.title}')),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 2),

              // Second Row - Horizontal Product Cards Section
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  itemCount: horizontalProducts2.length,
                  itemBuilder: (context, index) {
                    final product = horizontalProducts2[index];
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      child: ProductCardHorizontal(
                        imageUrl: product.imageUrl,
                        title: product.title,
                        category: product.category,
                        price: product.price,
                        isFavorite: product.isFavorite,
                        width: 350,
                        height: 90,

                        onCardPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Opening ${product.title}')),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              // Add more sections here if needed
            ],
          ),
        ),
      ),
    );
  }
}
