import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/custom_button.dart';
import 'package:payment_app/features/payment_details/presentation/views/widgets/payment_methods.dart';

Future<dynamic> customButtomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PaymentMethods(),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Paid",
                onTap: () {},
              ),
            ],
          ),
        );
      });
}
