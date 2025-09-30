import 'package:flutter/material.dart';

class ReviewRating extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const ReviewRating({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return IconButton(
          onPressed: () => onRatingChanged(starIndex),
          icon: Icon(
            rating >= starIndex
                ? Icons.star
                : Icons.star_border_purple500_sharp,
            size: 30,
            color: rating >= starIndex ? Colors.amberAccent : Colors.white,
          ),
        );
      }),
    );
  }
}
