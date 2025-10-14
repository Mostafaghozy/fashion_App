import 'package:e_commerce/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icons/Close Square.png"),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Image.asset("assets/Frame.png"),
                Positioned(
                  bottom: 15,
                  left: 40,
                  child: Text(
                    "Payment success!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Gap(10),
          Text(
            "Payment is completed!",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Gap(10),
          Text(
            "your order number is #1089324",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Gap(35),
          CustomButtonToCheckout(
            onTap: () {},
            text: "Order deliver status",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          CustomButtonToCheckout(
            onTap: () {},
            text: "Homepage",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            textColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
