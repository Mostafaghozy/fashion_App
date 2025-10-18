import 'package:e_commerce/features/presentation/screens/payment/PaymentSuccess.dart';
import 'package:e_commerce/features/presentation/widgets/cart/ComtainerChangeAddressWidget.dart';
import 'package:e_commerce/features/presentation/widgets/cart/ContainerPayWidget.dart';
import 'package:e_commerce/features/presentation/widgets/cart/CountryDropdown.dart';

import 'package:e_commerce/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:e_commerce/features/presentation/widgets/cart/CustomRowTotalCheck.dart';
import 'package:e_commerce/features/presentation/widgets/cart/FormFieldCustom.dart';
import 'package:e_commerce/features/presentation/widgets/cart/RadioListWidget.dart';
import 'package:e_commerce/features/presentation/widgets/cart/RowTwoDividersWidget.dart';
import 'package:e_commerce/features/presentation/widgets/cart/ZipCodeContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkout",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Gap(20),
              Text(
                "Delivery to",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              ContainerChangeAddressWidget(),

              Gap(20),
              Text(
                "Payment methods",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              Row(
                children: [
                  ContainerPayWidget(image: 'assets/pay/paypal (2) 1 (1).png'),
                  Gap(10),
                  ContainerPayWidget(image: 'assets/pay/apple pay.png'),
                  Gap(10),
                  ContainerPayWidget(image: 'assets/pay/gpay.png'),
                ],
              ),
              Gap(20),
              RowTwoDividersWidget(),
              Gap(10),
              PaymentSelectionScreen(),
              Text(
                "Will be saved in account setting.",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              ),
              Gap(10),
              Text(
                "Card information",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              ),
              Gap(5),
              FormFieldCustom(
                hintText: '**** **** **** ****',
                isCardNumber: true,
              ),
              Gap(10),
              Text(
                "Card holder name",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              ),
              Gap(5),
              FormFieldCustom(hintText: 'HOLDER NAME', isCardNumber: false),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Country or region",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Text(
                      "Zip",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(children: [CountryDropdown(), Gap(20), ZipCodeContainer()]),
              Gap(30),
              CustomRowTotalCheck(title: 'Total', price: '\$171.00'),
              Gap(20),
              CustomButtonToCheckout(
                text: 'Pay',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const PaymentSuccess();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
