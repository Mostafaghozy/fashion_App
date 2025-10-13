import 'package:flutter/material.dart';

// Default images used for category avatars. Exported for reuse.
const List<String> kCategoryDefaultImages = [
  'assets/all_product/Product4_home2.png',
  'assets/all_product/Product5_home1.png',
  'assets/all_product/10.png',
  'assets/all_product/Product3_Home3.png',
  'assets/all_product/h6-product-1-500x620.png',
  'assets/all_product/10.png',
  'assets/all_product/10.png',
  'assets/all_product/10.png',
];

// Category labels
const List<String> kCategories = [
  'Men’s T-shirt',
  'Women’s T-shirt',
  'skinner',
  'Long sleve',
  'party dresses',
  'skinner',
];

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.isActive = false,
    this.onTap,
  });

  final String imagePath;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.transparent, width: 3),
            ),
            child: SizedBox(
              width: 66,
              height: 66,
              child: ClipOval(
                child: Builder(
                  builder: (ctx) {
                    final dpr = MediaQuery.of(ctx).devicePixelRatio;
                    final cacheSize = (66 * dpr).round();
                    return Image.asset(
                      imagePath,
                      width: 66,
                      height: 66,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      cacheWidth: cacheSize,
                      cacheHeight: cacheSize,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[800],
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
