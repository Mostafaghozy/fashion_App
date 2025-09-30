import 'package:flutter/material.dart';

Widget buildDeliveryInfo() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Text(
          'Store fashion,\n12A, colombo road,\n#70119\nSri lanka\n+99 783 456 7',
          style: TextStyle(color: Colors.grey[400]),
        ),
      ],
    ),
  );
}
