import 'package:flutter/material.dart';

class StaticStarRating extends StatelessWidget {
  final double filledStars;
  final double totalStars;
  final double size;
  final Color color;

  const StaticStarRating({
    super.key,
    required this.filledStars,
    this.totalStars = 5.0,
    this.size = 20.0,
    this.color = const Color(0xffC9C52E),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalStars.toInt(), (index) {
        return Icon(
          index < filledStars ? Icons.star : Icons.star_border,
          color: color,
          size: size,
        );
      }),
    );
  }
}
