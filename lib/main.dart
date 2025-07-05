import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/services/api_keys.dart';

import 'package:payment_app/features/checkout_feature/presentation/views/cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publisherKey;
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//create paymentintentObject create payment intent (currency,amount)
//payment sheet (paymentIntentClientSecret)
//present paymentsheet()

//PaymentIntentModel createPaymentIntent(currency,amount,customerId)
//keySecret createEphemeralKey(stripeVersion, customerId)
//initPaymentSheet(merchantDisplayName, intentClientSecret,ephemeralKeySecret)
//presentPaymentSheet()
