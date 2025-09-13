import 'package:e_commerce/Ui/widgets/CollectionsFilterBar.dart';
import 'package:e_commerce/Ui/widgets/ContainerCustomWidget.dart';
import 'package:e_commerce/Ui/widgets/ProductCardComponent.dart';
import 'package:e_commerce/Ui/widgets/ProductCardHorizontal.dart';
import 'package:e_commerce/Ui/widgets/ProductCardGrid.dart';
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

  // Grid products for the 2x4 grid layout
  List<Product> gridProducts = [
    Product(
      id: '12',
      title: 'Women Bottoms Free sizes',
      category: 'Women\'s wear',
      price: 12.99,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
    Product(
      id: '13',
      title: 'party Frock #12',
      category: 'Women\'s wear',
      price: 46.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: false,
    ),
    Product(
      id: '14',
      title: 'Women\'s long sleve jacket',
      category: 'Women\'s wear',
      price: 26.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
    Product(
      id: '15',
      title: 'Men\'s long sleve jacket',
      category: 'Men\'s wear',
      price: 26.00,
      imageUrl: 'assets/modelMan1.png',
      isFavorite: false,
    ),
    Product(
      id: '16',
      title: 'Green Long sleve shirt',
      category: 'Men\'s wear',
      price: 25.00,
      imageUrl: 'assets/modelMan2.png',
      isFavorite: false,
    ),
    Product(
      id: '17',
      title: 'party Frock #12',
      category: 'Women\'s wear',
      price: 46.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
    Product(
      id: '18',
      title: 'sos Women Trousers',
      category: 'Women\'s wear',
      price: 32.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: false,
    ),
    Product(
      id: '19',
      title: 'Women Bottoms Free sizes',
      category: 'Women\'s wear',
      price: 12.99,
      imageUrl: 'assets/modelGirl3.png',
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

      // Check in gridProducts
      final gridIndex = gridProducts.indexWhere(
        (product) => product.id == productId,
      );
      if (gridIndex != -1) {
        gridProducts[gridIndex] = Product(
          id: gridProducts[gridIndex].id,
          title: gridProducts[gridIndex].title,
          category: gridProducts[gridIndex].category,
          price: gridProducts[gridIndex].price,
          imageUrl: gridProducts[gridIndex].imageUrl,
          isFavorite: !gridProducts[gridIndex].isFavorite,
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
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "All Product",
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
              SizedBox(height: 15),

              // Grid Products Section with 2 cards per row
              Column(
                children: [
                  // First row - 2 cards
                  Row(
                    children: [
                      // First card - normal height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[0].imageUrl,
                            title: gridProducts[0].title,
                            price: gridProducts[0].price,
                            isFavorite: gridProducts[0].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[0].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[0].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Second card - shorter height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[1].imageUrl,
                            title: gridProducts[1].title,
                            price: gridProducts[1].price,
                            isFavorite: gridProducts[1].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[1].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[1].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Second row - 2 cards
                  Row(
                    children: [
                      // First card - shorter height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[2].imageUrl,
                            title: gridProducts[2].title,
                            price: gridProducts[2].price,
                            isFavorite: gridProducts[2].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[2].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[2].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Second card - normal height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[3].imageUrl,
                            title: gridProducts[3].title,
                            price: gridProducts[3].price,
                            isFavorite: gridProducts[3].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[3].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[3].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Third row - 2 cards
                  Row(
                    children: [
                      // First card - normal height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[4].imageUrl,
                            title: gridProducts[4].title,
                            price: gridProducts[4].price,
                            isFavorite: gridProducts[4].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[4].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[4].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Second card - shorter height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[5].imageUrl,
                            title: gridProducts[5].title,
                            price: gridProducts[5].price,
                            isFavorite: gridProducts[5].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[5].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[5].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Fourth row - 2 cards
                  Row(
                    children: [
                      // First card - shorter height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[6].imageUrl,
                            title: gridProducts[6].title,
                            price: gridProducts[6].price,
                            isFavorite: gridProducts[6].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[6].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[6].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Second card - normal height
                      Expanded(
                        child: Container(
                          height: 300,
                          child: ProductCardGrid(
                            imageUrl: gridProducts[7].imageUrl,
                            title: gridProducts[7].title,
                            price: gridProducts[7].price,
                            isFavorite: gridProducts[7].isFavorite,
                            onFavoritePressed: () =>
                                toggleFavorite(gridProducts[7].id),
                            onCardPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Opening ${gridProducts[7].title}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Add more sections here if needed
            ],
          ),
        ),
      ),
    );
  }
}
