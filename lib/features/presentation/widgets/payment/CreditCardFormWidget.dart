import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardFormWidget extends StatelessWidget {
  const CreditCardFormWidget({
    super.key,
    required this.formKey,
    required this.cardNumber,
    required this.cvvCode,
    required this.cardHolderName,
    required this.expiryDate,
    required this.onCreditCardModelChange,
  });

  final GlobalKey<FormState> formKey;
  final String cardNumber;
  final String cvvCode;
  final String cardHolderName;
  final String expiryDate;
  final void Function(CreditCardModel) onCreditCardModelChange;

  @override
  Widget build(BuildContext context) {
    final inputConfig = InputConfiguration(
      cardNumberDecoration: InputDecoration(
        label: const Text('Card number'),
        hintText: '0000 0000 0000 0000',
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white30),
        prefixIcon: Image.asset(
          'assets/icons/credit-card.png',
          height: 48,
          width: 48,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      expiryDateDecoration: InputDecoration(
        label: const Text('Exp date'),
        hintText: '00/00',
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white30),
        prefixIcon: Image.asset(
          'assets/icons/calendar.png',
          height: 48,
          width: 48,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      cvvCodeDecoration: InputDecoration(
        label: const Text('CVV'),
        hintText: '000',
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white30),
        prefixIcon: Image.asset('assets/icons/lock.png', height: 48, width: 48),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      cardNumberTextStyle: const TextStyle(color: Colors.white),
      expiryDateTextStyle: const TextStyle(color: Colors.white),
      cvvCodeTextStyle: const TextStyle(color: Colors.white),
    );

    return CreditCardForm(
      formKey: formKey,
      obscureCvv: true,
      obscureNumber: false,
      cardNumber: cardNumber,
      cvvCode: cvvCode,
      isHolderNameVisible: false,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      cardHolderName: cardHolderName,
      expiryDate: expiryDate,
      inputConfiguration: inputConfig,
      onCreditCardModelChange: onCreditCardModelChange,
    );
  }
}
