import 'package:flutter/material.dart';

import 'package:payment_app/features/thank_you/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:payment_app/features/thank_you/presentation/views/widgets/custom_container.dart';
import 'package:payment_app/features/thank_you/presentation/views/widgets/dashed_line.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CustomContainer(),
        const Positioned(left: 0, right: 0, child: CustomCircleAvatar()),
        Positioned(
            top: MediaQuery.sizeOf(context).height * .6,
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            )),
        Positioned(
            right: 0,
            top: MediaQuery.sizeOf(context).height * .6,
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            )),
        Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.sizeOf(context).height * .62,
            child: const DashedLine())
      ],
    );
  }
}
