import 'package:e_commerce/Ui/screens/home/MainScreen.dart';
import 'package:e_commerce/Ui/screens/search/SearchScreen.dart';
import 'package:e_commerce/Ui/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/Ui/widgets/category/HorizontalProductCardList.dart';
import 'package:e_commerce/Ui/widgets/category/HorizontalProductList.dart';
import 'package:e_commerce/Ui/widgets/category/ProductGridSection.dart';
import 'package:e_commerce/Ui/widgets/appbarCustomWidget.dart';
import 'package:e_commerce/data/services/ProductDataService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/category/section_title.dart';
import '../../widgets/category/category_item.dart';
import '../../widgets/category/category_list.dart';
import '../../widgets/category/sort_filter_bar.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key, List<String>? images})
    : images = images ?? kCategoryDefaultImages;

  final List<String> images;

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  void toggleFavorite(String productId) {
    setState(() {
      ProductDataService.toggleFavorite(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const SectionTitle(title: 'Categories'),
                const SizedBox(height: 8),
                CategoryList(
                  images: widget.images,
                  labels: kCategories,
                  initialIndex: 0,
                  onSelected: (index) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Selected category: ${kCategories[index]}',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 18),

                // Trending collections (horizontal)
                const SectionTitle(title: 'Trending clothes'),
                const SizedBox(height: 8),
                ProductDataService.getFavoriteProducts().isEmpty
                    ? Container(
                        height: 300,
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
                const SizedBox(height: 18),

                const SectionTitle(title: 'New arrivals'),
                const SizedBox(height: 8),
                HorizontalProductCardList(
                  products: ProductDataService.getHorizontalProducts(),
                  onCardPressed: (product) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Opening ${product.title}')),
                    );
                  },
                ),

                SizedBox(height: 0.5),

                HorizontalProductCardList(
                  products: ProductDataService.getHorizontalProducts2(),
                  onCardPressed: (product) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Opening ${product.title}')),
                    );
                  },
                ),
                const SizedBox(height: 15),

                const SectionTitle(title: 'Top sale products'),
                const SizedBox(height: 8),
                ProductDataService.getFavoriteProducts().isEmpty
                    ? Container(
                        height: 300,
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
                const SizedBox(height: 15),

                const SectionTitle(title: 'Summer collection'),
                const SizedBox(height: 8),
                ProductGridSection(
                  products: ProductDataService.getGridProducts(),
                  onToggleFavorite: toggleFavorite,
                  onCardPressed: (product) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Opening ${product.title}')),
                    );
                  },
                ),
                const SizedBox(height: 20),
                SortFilterBar(
                  onSort: () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Sort tapped'))),
                  onFilter: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filter tapped')),
                  ),
                ),
              ],
            ),
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
