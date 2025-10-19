import 'package:flutter/material.dart';

class CustomButtonToCheckout extends StatelessWidget {
  const CustomButtonToCheckout({
    super.key,
    required this.text,
    required this.onTap,
    this.fontWeight,
    this.fontSize,
    this.textColor,
    this.backgroundColor,
  });
  final String text;
  final VoidCallback onTap;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 15,
              color: textColor ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
