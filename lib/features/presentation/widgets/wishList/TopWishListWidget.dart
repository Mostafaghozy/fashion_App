import 'package:flutter/material.dart';

class TopWishListWidget extends StatelessWidget {
  const TopWishListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Wishlist',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Text(
              "Recently added",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white70,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
