import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RowCart extends StatelessWidget {
  const RowCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              'Size:',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Text(
              ' L',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Gap(20),
        Row(
          children: [
            Text(
              "Color:",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Gap(5),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
