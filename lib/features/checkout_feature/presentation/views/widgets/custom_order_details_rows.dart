import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomOrderDetailsRow extends StatelessWidget {
  const CustomOrderDetailsRow({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles().style18,
        ),
        const Spacer(),
        Text(
          price,
          style: Styles().style18,
        )
      ],
    );
  }
}
