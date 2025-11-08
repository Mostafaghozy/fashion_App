import 'package:e_commerce/features/presentation/screens/payment/ConfirmCardScreen.dart';
import 'package:e_commerce/features/presentation/screens/payment/CreditCardScreen.dart';
import 'package:e_commerce/features/presentation/widgets/payment/PaymentMethodCard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

int selectedIndex = 0;

final List<Map<String, dynamic>> _cards = [
  {
    'logo': 'assets/pay/VISA.png',
    'cardType': 'VISA',
    'maskedNumber': '421689******1560',
    'expiry': 'Expires 09/23',
    'isDefault': true,
  },
  {
    'logo': 'assets/pay/Mastercard.png',
    'cardType': 'MASTERCARD',
    'maskedNumber': '421689******1560',
    'expiry': 'Expires 09/23',
    'isDefault': false,
  },
];

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  // Whether the Add button should mark the new card as default
  bool _setNewAsDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white54),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  final card = _cards[index];
                  return GestureDetector(
                    onTap: () {
                      // Just navigate to confirm screen without changing default
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmCardScreen(
                            cardNumber: card['maskedNumber'],
                            expiryDate: card['expiry'],
                            cardHolderName: '',
                            cvvCode: '',
                            isDefault: card['isDefault'],
                          ),
                        ),
                      );
                    },
                    child: PaymentMethodCard(
                      logo: card['logo'],
                      cardType: card['cardType'],
                      maskedNumber: card['maskedNumber'] ?? card['cardNumber'],
                      expiry: card['expiry'],
                      isDefault: card['isDefault'] == true,
                      onSelect: () {
                        setState(() {
                          // Set this card as default and unset others
                          for (var i = 0; i < _cards.length; i++) {
                            _cards[i]['isDefault'] = i == index;
                          }
                          selectedIndex = index;
                          // Show confirmation
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Set as default payment method'),
                            ),
                          );
                        });
                      },
                      onDelete: card['isDefault'] == true
                          ? null
                          : () {
                              setState(() {
                                _cards.removeAt(index);
                                // If we removed a card before the selected one, adjust the index
                                if (index < selectedIndex) {
                                  selectedIndex--;
                                }
                                // Keep selectedIndex in bounds
                                if (selectedIndex >= _cards.length) {
                                  selectedIndex = _cards.length - 1;
                                }
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Card removed')),
                              );
                            },
                    ),
                  );
                },
              ),
            ),

            // Bottom Add area: toggle + Add button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final newCard = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardDetailsScreen(),
                          ),
                        );

                        if (newCard != null && mounted) {
                          setState(() {
                            // If the incoming card is default, clear previous defaults
                            if (newCard['isDefault'] == true) {
                              for (var c in _cards) {
                                c['isDefault'] = false;
                              }
                            }

                            _cards.add({
                              'logo': newCard['logo'],
                              'cardType': newCard['cardType'],
                              'maskedNumber': newCard['cardNumber']
                                  .replaceRange(
                                    6,
                                    newCard['cardNumber'].length - 4,
                                    '******',
                                  ),
                              'expiry': 'Expires ${newCard['expiry']}',
                              'isDefault': newCard['isDefault'],
                            });

                            // If the added card is default, select it
                            if (newCard['isDefault'] == true) {
                              selectedIndex = _cards.length - 1;
                            }
                          });
                        }
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
