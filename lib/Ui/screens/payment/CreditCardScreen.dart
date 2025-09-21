import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  String cardNumber = "", expiryDate = "", cardHolderName = "", cvvCode = "";
  bool showBackView = false;
  bool isDefaultPayment = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _onContinuePressed() {
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with payment
      print('Card Number: $cardNumber');
      print('Expiry Date: $expiryDate');
      print('Card Holder: $cardHolderName');
      print('CVV: $cvvCode');
      print('Set as Default: $isDefaultPayment');

      // TODO: Add your payment processing logic here
      // For now, just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment method added successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate back or to next screen
      Navigator.pop(context);
    } else {
      // Form is invalid, show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Add card details',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CreditCardWidget(
                cardNumber: cardNumber,
                textStyle: TextStyle(color: Colors.white70),
                expiryDate: expiryDate,

                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                cardType: CardType.visa,
                showBackView: showBackView,

                glassmorphismConfig: Glassmorphism(
                  blurX: 20.0,
                  blurY: 5,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Colors.black54,
                      const Color.fromARGB(115, 216, 181, 5),
                    ],
                    stops: const <double>[0.8, 0.1],
                  ),
                ),
                isHolderNameVisible: true,

                onCreditCardWidgetChange: (value) {},
              ),
              CreditCardForm(
                autovalidateMode: autovalidateMode,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                inputConfiguration: InputConfiguration(
                  cardNumberTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Jost",
                  ),
                  cardHolderTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  expiryDateTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  cvvCodeTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                cvvCode: cvvCode,
                onCreditCardModelChange: (CreditCardModel) {
                  setState(() {
                    cardNumber = CreditCardModel.cardNumber;
                    expiryDate = CreditCardModel.expiryDate;
                    cardHolderName = CreditCardModel.cardHolderName;
                    cvvCode = CreditCardModel.cvvCode;
                    showBackView = CreditCardModel.isCvvFocused;
                  });
                },
                formKey: formKey,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDefaultPayment = !isDefaultPayment;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amberAccent),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.transparent,
                        ),
                        child: isDefaultPayment
                            ? Icon(
                                Icons.check,
                                color: Colors.amberAccent,
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Set as your default payment method',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // Continue button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onContinuePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text('Add', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
