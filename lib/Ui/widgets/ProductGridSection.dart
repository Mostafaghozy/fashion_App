import 'package:e_commerce/Ui/widgets/ProductCardGrid.dart';
import 'package:e_commerce/data/model/productModel.dart';
import 'package:flutter/material.dart';

class ProductGridSection extends StatelessWidget {
  final List<Product> products;
  final Function(String) onToggleFavorite;
  final Function(Product) onCardPressed;

  const ProductGridSection({
    Key? key,
    required this.products,
    required this.onToggleFavorite,
    required this.onCardPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row - 2 cards
        Row(
          children: [
            _buildGridCard(products[0], context),
            SizedBox(width: 10),
            _buildGridCard(products[1], context),
          ],
        ),
        SizedBox(height: 10),
        // Second row - 2 cards
        Row(
          children: [
            _buildGridCard(products[2], context),
            SizedBox(width: 10),
            _buildGridCard(products[3], context),
          ],
        ),
        SizedBox(height: 10),
        // Third row - 2 cards
        Row(
          children: [
            _buildGridCard(products[4], context),
            SizedBox(width: 10),
            _buildGridCard(products[5], context),
          ],
        ),
        SizedBox(height: 10),
        // Fourth row - 2 cards
        Row(
          children: [
            _buildGridCard(products[6], context),
            SizedBox(width: 10),
            _buildGridCard(products[7], context),
          ],
        ),
      ],
    );
  }

  Widget _buildGridCard(Product product, BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        child: ProductCardGrid(
          imageUrl: product.imageUrl,
          title: product.title,
          price: product.price,
          isFavorite: product.isFavorite,
          onFavoritePressed: () => onToggleFavorite(product.id),
          onCardPressed: () => onCardPressed(product),
        ),
      ),
    );
  }
}
