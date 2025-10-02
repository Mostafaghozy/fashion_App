import 'package:flutter/material.dart';

Row seeAllWidget({
  VoidCallback? onTap,
  required String text1,
  required String text2,
}) {
  return Row(
    children: [
      Text(text1, style: TextStyle(fontWeight: FontWeight.bold)),
      Spacer(),
      GestureDetector(
        onTap: () {
          VoidCallback;
        },
        child: Row(
          children: [
            Text(text2),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward_ios_rounded, size: 15),
          ],
        ),
      ),
    ],
  );
}
