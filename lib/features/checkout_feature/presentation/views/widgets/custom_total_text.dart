import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomTotalText extends StatelessWidget {
  const CustomTotalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Total",
          style: Styles().styleSemiBold24,
        ),
        const Spacer(),
        Text(
          "\$50.97",
          style: Styles().styleSemiBold24,
        )
      ],
    );
  }
}
