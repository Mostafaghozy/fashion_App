import 'package:flutter/material.dart';

class PaymentOptionsWidget extends StatelessWidget {
  const PaymentOptionsWidget({
    super.key,
    required this.image,
    required this.title,
    this.hasWhiteBackground = false,
  });
  final String image;
  final String title;
  final bool hasWhiteBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle credit/debit card selection
        print('Credit or debit card selected');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,

          border: Border.all(color: Colors.transparent),
        ),
        child: Row(
          children: [
            hasWhiteBackground
                ? Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Image.asset(image)),
                  )
                : Image.asset(
                    image,
                    width: image.contains('credit-card') ? 70 : 24,
                    height: image.contains('credit-card') ? 70 : 24,
                  ),
            SizedBox(width: 16),
            // Text
            Text(
              title,
              style: TextStyle(
                fontSize: 16,

                color: Colors.white.withOpacity(0.9),
              ),
            ),

            Spacer(),

            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.7),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
