import 'package:flutter/material.dart';

Widget buildProductsList() {
  return Column(
    children: [
      _buildProductItem(
        "Women's cotton bottoms",
        "\$52.00",
        "Color: grey | Size: Medium",
        "Qty: 2",
      ),
      const SizedBox(height: 12),
      _buildProductItem(
        "Women's silk blouse",
        "\$27.98",
        "Color: yellow | Size: 32",
        "Qty: 1",
      ),
    ],
  );
}

Widget _buildProductItem(
  String name,
  String price,
  String details,
  String quantity,
) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Image.asset("assets/modelGirl1.png", width: 80, height: 80),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    price,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    details,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    quantity,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
