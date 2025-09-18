import 'package:flutter/material.dart';

class RowProfileWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback? onTap;

  const RowProfileWidget({
    super.key,
    required this.imageAsset,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(imageAsset),
          const SizedBox(width: 20),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, size: 15),
        ],
      ),
    );
  }
}
