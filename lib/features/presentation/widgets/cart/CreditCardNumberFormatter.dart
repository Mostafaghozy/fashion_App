import 'package:flutter/services.dart';

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    //create digitsOnly not letters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    //digitsOnly = 16 numbers only
    if (digitsOnly.length > 16) {
      digitsOnly = digitsOnly.substring(0, 16);
    }
    //create space every 4 digits

    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      formatted += digitsOnly[i];
      if ((i + 1) % 4 == 0 && (i + 1) != digitsOnly.length) {
        formatted += ' ';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
