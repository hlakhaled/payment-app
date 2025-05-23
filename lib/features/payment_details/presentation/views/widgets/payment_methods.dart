import 'package:flutter/material.dart';
import 'package:payment_app/constants/assets.dart';
import 'package:payment_app/features/payment_details/presentation/views/widgets/payment_method.dart';

class PaymentMethods extends StatefulWidget {
  PaymentMethods({
    super.key,
  });
  int activeIndex = 0;
  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<String> image = const [
    Assets.imagesCard,
    Assets.imagesPaypal,
    Assets.imagesPay
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.activeIndex = index;
              });
            },
            child: PaymentMethod(
              image: image[index],
              isActive: index == widget.activeIndex,
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
      ),
    );
  }
}
