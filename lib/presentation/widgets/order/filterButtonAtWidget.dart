import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white70 : const Color(0xFF9A9A9A),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 30,
              height: 2,
              color: isActive ? Colors.white70 : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
