import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/widgets/custom_button.dart';
import 'package:payment_app/features/payment_details/presentation/views/widgets/payment_methods.dart';

class BottomSheetBody extends StatelessWidget {
  final bool isLoading;
  final void Function() onTap;
  const BottomSheetBody(
      {super.key, required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
            title: "Continue",
            onTap: onTap,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
