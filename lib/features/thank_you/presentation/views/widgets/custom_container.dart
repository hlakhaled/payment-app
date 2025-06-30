import 'package:flutter/material.dart';

import 'package:payment_app/features/thank_you/presentation/views/widgets/container_body.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xffEDEDED),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 50),
          child: ContainerBody(),
        ),
      ),
    );
  }
}
