import 'package:flutter/material.dart';

class RowProfileWidget extends StatelessWidget {
  final String imageAsset;
  final String title;

  const RowProfileWidget({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageAsset),
        const SizedBox(width: 20),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios_rounded, size: 15),
      ],
    );
  }
}
