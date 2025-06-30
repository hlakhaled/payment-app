import 'package:flutter/material.dart';
import 'package:payment_app/features/payment_details/presentation/views/widgets/custom_credit_card.dart';

import 'package:payment_app/features/payment_details/presentation/views/widgets/payment_methods.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          PaymentMethods(),
          const CustomCreditCard()
        ],
      ),
    );
  }
}
