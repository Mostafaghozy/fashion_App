import 'package:flutter/material.dart';

class CustomRowTotalCheck extends StatelessWidget {
  const CustomRowTotalCheck({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
