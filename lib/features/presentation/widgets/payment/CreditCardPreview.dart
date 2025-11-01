import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardPreview extends StatelessWidget {
  const CreditCardPreview({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
    required this.cardBgColor,
    this.backgroundImage,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;
  final Color cardBgColor;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      textStyle: const TextStyle(color: Colors.white),
      cvvCode: cvvCode,
      cardType: CardType.visa,
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: false,
      cardBgColor: cardBgColor,
      backgroundImage: backgroundImage,
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (_) {},
    );
  }
}
