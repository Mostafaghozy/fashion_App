import 'package:flutter/material.dart';

class DefaultPaymentRow extends StatelessWidget {
  const DefaultPaymentRow({
    super.key,
    required this.isDefault,
    required this.onToggle,
  });

  final bool isDefault;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amberAccent),
                borderRadius: BorderRadius.circular(4),
                color: Colors.transparent,
              ),
              child: isDefault
                  ? const Icon(Icons.check, color: Colors.amberAccent, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Set as your default payment method',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
