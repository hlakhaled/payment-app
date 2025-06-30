
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/constants/assets.dart';
import 'package:payment_app/core/utils/styles.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              SvgPicture.asset(Assets.imagesLogo),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Credit Card', style: Styles().style18),
                    Text('Mastercard **78 ', style: Styles().style16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
