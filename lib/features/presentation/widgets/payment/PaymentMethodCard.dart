import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final String logo;
  final String cardType;
  final String maskedNumber;
  final String expiry;
  final bool isDefault;

  const PaymentMethodCard({
    super.key,
    required this.logo,
    required this.cardType,
    required this.maskedNumber,
    required this.expiry,
    this.isDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Logo box
          Image.asset(logo, fit: BoxFit.contain),
          const SizedBox(width: 12),
          // Card details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maskedNumber,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  expiry,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          if (isDefault) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: const Text(
                'Default',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
