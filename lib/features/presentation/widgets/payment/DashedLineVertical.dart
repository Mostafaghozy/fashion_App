import 'package:flutter/material.dart';

class DashedLineVertical extends StatelessWidget {
  final double height; // ارتفاع الخط الكلي
  final Color color; // لون الخط
  final double dashHeight; // طول كل شرطة
  final double dashSpace; // المسافة بين الشرطات
  final double strokeWidth; // سُمك الخط

  const DashedLineVertical({
    super.key,
    this.height = 40, // الارتفاع الافتراضي
    this.color = Colors.grey,
    this.dashHeight = 4, // طول الشرطة
    this.dashSpace = 3, // المسافة بين الشرطات
    this.strokeWidth = 2, // سُمك الخط
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (height ~/ (dashHeight + dashSpace)).toInt(),
          (index) =>
              Container(width: strokeWidth, height: dashHeight, color: color),
        ),
      ),
    );
  }
}
