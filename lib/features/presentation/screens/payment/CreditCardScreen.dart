import 'package:e_commerce/features/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/features/presentation/screens/home/Root.dart';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = 'Fashion App';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  bool isDefaultPaymentMethod = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isDefaultPayment = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
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
              // Credit Card Widget
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                textStyle: TextStyle(color: Colors.white),
                cvvCode: cvvCode,
                cardType: CardType.visa,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                // glassmorphismConfig: Glassmorphism(
                //   blurX: 10,
                //   blurY: 10,
                //   gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: <Color>[
                //       Colors.white.withOpacity(0.15),
                //       Colors.white.withOpacity(0.05),
                //     ],
                //     stops: const <double>[0.3, 0.0],
                //   ),
                // ),
                obscureCardCvv: true,
                isHolderNameVisible: false,
                cardBgColor: const Color(0xFF2a2a2a),
                backgroundImage: useBackgroundImage
                    ? 'assets/pay/cardPic.png'
                    : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              ),
              // Header above Card Number field

              // Credit Card Form
              CreditCardForm(
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
                inputConfiguration: InputConfiguration(
                  cardNumberDecoration: InputDecoration(
                    label: Text("Card number"),
                    hintText: '0000 0000 0000 0000',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Image.asset(
                      'assets/icons/credit-card.png',
                      height: 48,
                      width: 48,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  expiryDateDecoration: InputDecoration(
                    label: Text("Exp date"),
                    hintText: '00/00',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Image.asset(
                      'assets/icons/calendar.png',
                      height: 48,
                      width: 48,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  cvvCodeDecoration: InputDecoration(
                    label: Text("CVV"),
                    hintText: '000',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Image.asset(
                      'assets/icons/lock.png',
                      height: 48,
                      width: 48,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                  cardNumberTextStyle: TextStyle(color: Colors.white),
                  expiryDateTextStyle: TextStyle(color: Colors.white),
                  cvvCodeTextStyle: TextStyle(color: Colors.white),
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              SizedBox(height: 20),
              // Default payment method checkbox
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {
                      //   print('Valid card details');
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootScreen(initialIndex: index),
            ),
          );
        },
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
