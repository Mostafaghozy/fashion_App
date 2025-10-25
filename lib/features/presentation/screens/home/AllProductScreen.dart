import 'package:e_commerce/features/presentation/widgets/CartNotificationBottomSheet.dart';
import 'package:e_commerce/features/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/features/presentation/widgets/home/appbarCustomWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/HorizontalProductCardList.dart';
import 'package:e_commerce/features/presentation/widgets/home/CardItem.dart';

import 'package:e_commerce/features/presentation/widgets/category/category_item.dart';
import 'package:e_commerce/features/presentation/widgets/category/category_list.dart';
import 'package:e_commerce/features/presentation/widgets/search/section_title.dart';
import 'package:e_commerce/features/presentation/widgets/home/sort_filter_bar.dart';
import 'package:e_commerce/features/presentation/screens/home/Root.dart';

import 'package:e_commerce/features/data/services/ProductDataService.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key, List<String>? images})
    : images = images ?? kCategoryDefaultImages;

  final List<String> images;

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  void addToCart(String productName) {
    // Here you can add your cart logic
    // For now, we'll just show the notification
    CartNotificationBottomSheet.show(
      context,
      productName: productName,
      onViewCart: () {
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

                const SizedBox(height: 18),

                const SectionTitle(title: 'New arrivals'),
                const SizedBox(height: 8),

                SizedBox(height: 0.5),

                const SizedBox(height: 15),

                const SectionTitle(title: 'Top sale products'),
                const SizedBox(height: 8),

                const SizedBox(height: 15),

                const SectionTitle(title: 'Summer collection'),
                const SizedBox(height: 8),

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
    );
  }
}
