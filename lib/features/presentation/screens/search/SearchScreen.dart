import 'package:e_commerce/features/presentation/widgets/appbarCustomWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/HorizontalProductCardList.dart';
import 'package:e_commerce/features/presentation/widgets/category/HorizontalProductList.dart';
import 'package:e_commerce/features/presentation/widgets/category/RecentSearchWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/ScanWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/SearchWidget.dart';
import 'package:e_commerce/features/presentation/widgets/category/category_item.dart';
import 'package:e_commerce/features/presentation/widgets/category/category_list.dart';
import 'package:e_commerce/features/presentation/widgets/category/section_title.dart';
import 'package:e_commerce/features/presentation/widgets/category/sort_filter_bar.dart';
import 'package:e_commerce/features/presentation/screens/search/SearchInputScreen.dart';
import 'package:e_commerce/features/presentation/screens/search/SearchResultsScreen.dart';
import 'package:e_commerce/features/presentation/screens/search/ScanScreen.dart';

import 'package:e_commerce/features/data/services/ProductDataService.dart';
import 'package:e_commerce/features/data/services/SearchHistoryService.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, List<String>? images})
    : images = images ?? kCategoryDefaultImages;

  final List<String> images;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: SearchWidget(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchInputScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    ScanWidget(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ScanScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SectionTitle(title: 'Categories'),
              CategoryList(
                images: widget.images,
                labels: kCategories,
                initialIndex: 0,
                onSelected: (index) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchResultsScreen(
                        searchQuery: kCategories[index],
                        category: kCategories[index],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              RecentSearchWidget(
                recentSearches: SearchHistoryService.getRecentSearches(),
                onSearchTap: (search) {
                  SearchHistoryService.addSearch(search);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchResultsScreen(searchQuery: search),
                    ),
                  );
                },
                onClearAll: () {
                  setState(() {
                    SearchHistoryService.clearAllSearches();
                  });
                },
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Trending clothes'),
              const SizedBox(height: 8),
              HorizontalProductList(
                products: ProductDataService.getHorizontalProducts(),
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
              HorizontalProductList(
                products: ProductDataService.getGridProducts().take(6).toList(),
                onToggleFavorite: toggleFavorite,
              ),
              const SizedBox(height: 15),
              SortFilterBar(
                onSort: () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Sort tapped'))),
                onFilter: () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Filter tapped'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
