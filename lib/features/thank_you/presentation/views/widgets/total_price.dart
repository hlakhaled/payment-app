import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Total',
            textAlign: TextAlign.center, style: Styles().styleSemiBold24),
        Text('\$50.97',
            textAlign: TextAlign.center, style: Styles().styleSemiBold24)
      ],
    );
  }
}
