import 'package:e_commerce/Ui/widgets/ProductCardComponent.dart';
import 'package:e_commerce/model/productModel.dart';
import 'package:flutter/material.dart';

class HorizontalProductList extends StatefulWidget {
  final List<Product> products;
  final Function(String) onToggleFavorite;

  const HorizontalProductList({
    Key? key,
    required this.products,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  State<HorizontalProductList> createState() => _HorizontalProductListState();
}

class _HorizontalProductListState extends State<HorizontalProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 5),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Container(
            margin: EdgeInsets.only(right: 15),
            child: ProductCard(
              imageUrl: product.imageUrl,
              title: product.title,
              price: product.price,
              isFavorite: product.isFavorite,
              width: 180,
              height: 280,
              onFavoritePressed: () => widget.onToggleFavorite(product.id),
              onCardPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Opening ${product.title}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
