import 'package:e_commerce/Ui/widgets/ProductCardHorizontal.dart';
import 'package:e_commerce/data/model/productModel.dart';
import 'package:flutter/material.dart';

class HorizontalProductCardList extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onCardPressed;

  const HorizontalProductCardList({
    Key? key,
    required this.products,
    required this.onCardPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 90,
              onCardPressed: () => onCardPressed(product),
            ),
          );
        },
      ),
    );
  }
}
