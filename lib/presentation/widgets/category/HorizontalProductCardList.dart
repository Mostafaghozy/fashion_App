import 'package:e_commerce/presentation/widgets/category/ProductCardHorizontal.dart';
import 'package:e_commerce/features/data/models/productModel.dart';
import 'package:flutter/material.dart';

class HorizontalProductCardList extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onCardPressed;
  final Function(String)? onAddToCart;

  const HorizontalProductCardList({
    super.key,
    required this.products,
    required this.onCardPressed,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: EdgeInsets.only(right: 5),
            child: ProductCardHorizontal(
              imageUrl: product.imageUrl,
              title: product.title,
              category: product.category,
              price: product.price,
              isFavorite: product.isFavorite,
              width: 350,
              height: 100,
              onCardPressed: () => onCardPressed(product),
              onAddToCart: () => onAddToCart?.call(product.title),
            ),
          );
        },
      ),
    );
  }
}
