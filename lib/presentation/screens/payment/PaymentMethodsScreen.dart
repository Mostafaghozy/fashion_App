import 'package:e_commerce/presentation/widgets/payment/PaymentMethodCard.dart';
import 'package:e_commerce/presentation/screens/payment/PaymentScreen.dart';
import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, size: 18),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Edit your payment methods',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  PaymentMethodCard(
                    logo: 'assets/pay/Payment Method.png',
                    cardType: 'VISA',
                    maskedNumber: '421689******1560',
                    expiry: 'Expires 09/23',
                    isDefault: true,
                  ),
                  Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.5)),
                  PaymentMethodCard(
                    logo: 'assets/pay/Payment Method (1).png',
                    cardType: 'MASTERCARD',
                    maskedNumber: '421689******1560',
                    expiry: 'Expires 09/23',
                    isDefault: false,
                  ),
                  Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.5)),
                ],
              ),
            ),

            // Bottom Add button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentOptionsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, color: Colors.black),
                  label: const Text(
                    'Add new payment method',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
