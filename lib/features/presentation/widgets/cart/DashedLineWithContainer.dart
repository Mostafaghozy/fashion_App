import 'package:flutter/material.dart';

class DashedLineWithContainers extends StatelessWidget {
  const DashedLineWithContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(60, (index) {
        if (index % 2 == 0) {
          return Container(width: 8, height: 1, color: Colors.grey[700]);
        }
        return const SizedBox(width: 5);
      }),
    );
  }
}
