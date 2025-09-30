import 'package:flutter/material.dart';

class CustomButtonOrderInfo extends StatelessWidget {
  const CustomButtonOrderInfo({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.image,
    this.color,
  });
  final String text;
  final double width;
  final double height;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.white60, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
