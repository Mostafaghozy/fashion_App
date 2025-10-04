import 'package:flutter/material.dart';

class ScanWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? iconScale;

  const ScanWidget({
    super.key,
    this.onTap,
    this.width = 40,
    this.height = 40,
    this.iconScale = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset("assets/icons/Scan.png", scale: iconScale),
      ),
    );
  }
}
