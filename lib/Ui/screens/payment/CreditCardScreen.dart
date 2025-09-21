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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text(
                'Add card details',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Jost',
                ),
              ),
              CreditCardWidget(
                cardNumber: cardNumber,
                textStyle: TextStyle(color: Colors.white70),
                expiryDate: expiryDate,

                cardBgColor: Colors.lightBlueAccent,
                chipColor: Colors.white,
                cardHolderName: "Mostafa Ghozzy",
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
            ],
          ),
        ),
      ),
    );
  }
}
