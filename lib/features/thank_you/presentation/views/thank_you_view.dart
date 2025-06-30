import 'package:flutter/material.dart';

import 'package:payment_app/features/thank_you/presentation/views/widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.arrow_back),
            centerTitle: true,
          ),
          body: Transform.translate(
              offset: const Offset(0, -16), child: const ThankYouBody())),
    );
  }
}
