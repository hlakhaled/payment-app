import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title, textAlign: TextAlign.center, style: Styles().style18),
        Text(desc, style: Styles().styleSemiBold18),
      ],
    );
  }
}
