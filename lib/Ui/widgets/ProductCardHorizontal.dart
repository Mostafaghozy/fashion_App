import 'package:flutter/material.dart';

class ProductCardHorizontal extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double price;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onCardPressed;
  final double? width;
  final double? height;

  const ProductCardHorizontal({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    this.isFavorite = true,
    this.onFavoritePressed,
    this.onCardPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        width: width ?? 320,
        height: height ?? 120,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 15, 15, 15), // Dark grey background
        ),
        child: Row(
          children: [
            // Image Section (Left side)
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product Details Section (Right side)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Category
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    // Price and Favorite Button Row
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
