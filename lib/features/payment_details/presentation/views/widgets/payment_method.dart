import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/constants/assets.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            color: isActive ? const Color(0xFF34A853) : Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          isActive
              ? const BoxShadow(
                  color: Color(0xFF34A853),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              : const BoxShadow()
        ],
      ),
      duration: const Duration(milliseconds: 600),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            height: 24,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
