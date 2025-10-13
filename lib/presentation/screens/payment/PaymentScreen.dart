import 'package:e_commerce/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/presentation/widgets/payment/PaymentOptionsWidget.dart';
import 'package:e_commerce/presentation/screens/home/MainScreen.dart';
import 'package:e_commerce/presentation/screens/payment/add_paypal_screen.dart';

import 'package:e_commerce/presentation/screens/payment/CreditCardScreen.dart';
import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Pay with',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Jost',
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'payment currency: ',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                children: [
                  TextSpan(
                    text: 'USD',
                    style: TextStyle(fontSize: 16, color: Colors.yellow[600]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            PaymentOptionsWidget(
              image: 'assets/pay/credit-card.png',
              title: 'Credit or debit card',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CardDetailsScreen()),
                );
              },
            ),

            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),

            PaymentOptionsWidget(
              image: 'assets/pay/PayPal.png',
              title: 'PayPal',
              hasWhiteBackground: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddPayPalScreen()),
                );
              },
            ),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),

            PaymentOptionsWidget(
              image: 'assets/pay/ApplePay.png',
              title: 'Apple Pay',
              hasWhiteBackground: true,
            ),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}
