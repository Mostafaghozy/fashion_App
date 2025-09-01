import 'package:flutter/material.dart';

class ImageCustom extends StatelessWidget {
  final String imagePath;
  const ImageCustom({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
