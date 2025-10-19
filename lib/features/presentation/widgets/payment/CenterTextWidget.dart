import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CenterTextWidget extends StatelessWidget {
  const CenterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Estimate delivery",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(10),
          Text(
            "20 june 2022: 05:30 PM",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
