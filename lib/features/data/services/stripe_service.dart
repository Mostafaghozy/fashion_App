import 'dart:ui';

import 'package:e_commerce/core/api_keys.dart';
import 'package:e_commerce/features/data/models/stripe/payment_intent_input_model.dart';
import 'package:e_commerce/features/data/models/stripe/payment_intent_model/payment_intent_model.dart';
import 'package:e_commerce/features/data/services/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //first step createPaymentIntent
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.stripeSecretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  //second step initPaymentSheet
  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Fashion",
      ),
    );
  }

  //third step displyPaymentSheet
  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  // makePayment
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }
}
