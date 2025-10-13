import 'package:flutter/material.dart';

Widget buildPaymentInfo() {
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
          'Payment',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Text('Visa **** 1656', style: TextStyle(color: Colors.grey[400])),
            const SizedBox(width: 8),
            Image.asset("assets/pay/VISA.png", width: 40, height: 40),
          ],
        ),
      ],
    ),
  );
}
