import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class PaidButton extends StatelessWidget {
  const PaidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 113,
          height: 58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.50,
                color: Color(0xFF34A853),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text('Paid',
                textAlign: TextAlign.center, style: Styles().style24),
          ),
        ),
      ],
    );
  }
}
