import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/cart_view.dart';
import 'package:payment_app/features/payment_details/presentation/views/payment_details_view.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaymentDetailsView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
