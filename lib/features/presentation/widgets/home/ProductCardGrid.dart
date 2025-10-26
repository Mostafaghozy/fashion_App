import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 يخلي الكونتينر على قد المحتوى
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, height: 120, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
