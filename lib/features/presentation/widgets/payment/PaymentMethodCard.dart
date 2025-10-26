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
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          // Logo box
          Image.asset(logo, width: 70, height: 70, fit: BoxFit.contain),
          const SizedBox(width: 12),
          // Card details
          Column(
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
          Spacer(),

          if (isDefault) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white70, width: 1),
              ),
              child: const Text(
                'Default',
                style: TextStyle(fontSize: 10, color: Colors.white70),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
