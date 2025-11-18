import 'package:flutter/material.dart';

class ButtonLoginWith extends StatelessWidget {
  const ButtonLoginWith({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  final Widget icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey[600]!),
        ),
      ),
    );
  }
}
