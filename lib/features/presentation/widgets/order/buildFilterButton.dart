import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BuildFilterButton extends StatelessWidget {
  const BuildFilterButton({
    super.key,
    required this.text,
    required this.active,
    required this.onPressed,
  });
  final String text;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: active ? Colors.white : const Color(0xFF9A9A9A),
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            const Gap(8),
            Container(
              width: 20,
              height: 2,
              color: active ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
