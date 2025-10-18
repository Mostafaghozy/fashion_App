import 'package:flutter/material.dart';

class RowTwoDividersWidget extends StatelessWidget {
  const RowTwoDividersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade700, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            "or pay using a credit card",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade700, thickness: 1)),
      ],
    );
  }
}
