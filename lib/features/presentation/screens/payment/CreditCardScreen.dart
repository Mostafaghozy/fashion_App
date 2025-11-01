import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:e_commerce/features/presentation/widgets/payment/CreditCardPreview.dart';
import 'package:e_commerce/features/presentation/widgets/payment/CreditCardFormWidget.dart';
import 'package:e_commerce/features/presentation/widgets/payment/DefaultPaymentRow.dart';
import 'package:e_commerce/features/presentation/widgets/payment/AddPaymentButton.dart';

/// CardDetailsScreen (uses extracted widgets)
class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  // Model state
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = 'Fashion App';
  String _cvvCode = '';
  bool _isCvvFocused = false;
  bool _useBackgroundImage = true;
  bool _isDefaultPayment = true;

  // Form key forwarded to the package form widget
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Local styling constants
  static const _cardBgColor = Color(0xFF2a2a2a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white54),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    'Add card details',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Preview widget
                CreditCardPreview(
                  cardNumber: _cardNumber,
                  expiryDate: _expiryDate,
                  cardHolderName: _cardHolderName,
                  cvvCode: _cvvCode,
                  isCvvFocused: _isCvvFocused,
                  cardBgColor: _cardBgColor,
                  backgroundImage: _useBackgroundImage
                      ? 'assets/pay/cardPic.png'
                      : null,
                ),

                const SizedBox(height: 6),

                // Form widget
                CreditCardFormWidget(
                  formKey: _formKey,
                  cardNumber: _cardNumber,
                  cvvCode: _cvvCode,
                  cardHolderName: _cardHolderName,
                  expiryDate: _expiryDate,
                  onCreditCardModelChange: _onCreditCardModelChange,
                ),

                const SizedBox(height: 20),

                // Default payment row
                DefaultPaymentRow(
                  isDefault: _isDefaultPayment,
                  onToggle: () =>
                      setState(() => _isDefaultPayment = !_isDefaultPayment),
                ),

                const SizedBox(height: 40),

                // Add button
                AddPaymentButton(
                  onPressed: () {
                    final valid = _formKey.currentState?.validate() ?? false;
                    if (valid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Card added')),
                      );
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter valid card details'),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCreditCardModelChange(CreditCardModel model) {
    setState(() {
      _cardNumber = model.cardNumber;
      _expiryDate = model.expiryDate;
      _cardHolderName = model.cardHolderName;
      _cvvCode = model.cvvCode;
      _isCvvFocused = model.isCvvFocused;
    });
  }
}
