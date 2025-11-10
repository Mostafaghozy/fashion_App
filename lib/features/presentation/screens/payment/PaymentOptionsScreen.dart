import 'package:e_commerce/features/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/features/presentation/widgets/payment/PaymentOptionsWidget.dart';
import 'package:e_commerce/features/presentation/screens/home/Root.dart';
import 'package:e_commerce/features/presentation/screens/payment/add_paypal_screen.dart';

import 'package:e_commerce/features/presentation/screens/payment/CreditCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
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
              onTap: () async {
                final newCard = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardDetailsScreen(),
                  ),
                );

                if (newCard != null && mounted) {
                  Navigator.pop(context, newCard);
                }
              },
            ),

            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),

            PaymentOptionsWidget(
              image: 'assets/pay/PayPal.png',
              title: 'PayPal',
              hasWhiteBackground: true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckoutView(
                      sandboxMode: true,
                      clientId: "",
                      secretKey: "",
                      transactions: const [
                        {
                          "amount": {
                            "total": '70',
                            "currency": "USD",
                            "details": {
                              "subtotal": '70',
                              "shipping": '0',
                              "shipping_discount": 0,
                            },
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "Apple",
                                "quantity": 4,
                                "price": '5',
                                "currency": "USD",
                              },
                              {
                                "name": "Pineapple",
                                "quantity": 5,
                                "price": '10',
                                "currency": "USD",
                              },
                            ],

                            ///convert to ToJson

                            // shipping address is not required though
                            //   "shipping_address": {
                            //     "recipient_name": "tharwat",
                            //     "line1": "Alexandria",
                            //     "line2": "",
                            //     "city": "Alexandria",
                            //     "country_code": "EG",
                            //     "postal_code": "21505",
                            //     "phone": "+00000000",
                            //     "state": "Alexandria"
                            //  },
                          },
                        },
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                      },
                    ),
                  ),
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
    );
  }
}
