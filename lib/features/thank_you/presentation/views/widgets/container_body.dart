import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/thank_you/presentation/views/widgets/card_info.dart';
import 'package:payment_app/features/thank_you/presentation/views/widgets/custom_row.dart';
import 'package:payment_app/features/thank_you/presentation/views/widgets/paid_button.dart';
import 'package:payment_app/features/thank_you/presentation/views/widgets/total_price.dart';

class ContainerBody extends StatelessWidget {
  const ContainerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Thank you!',
            textAlign: TextAlign.center, style: Styles().style25),
        Text('Your transaction was successful',
            textAlign: TextAlign.center, style: Styles().style20),
        const SizedBox(
          height: 10,
        ),
        const CustomRow(
          title: "Date",
          desc: "01/24/2023",
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomRow(title: "Time", desc: "10:15 AM"),
        const SizedBox(
          height: 10,
        ),
        const CustomRow(
          title: "To",
          desc: "Sam Louis",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(
            color: Color(0xFFC6C6C6),
          ),
        ),
        const TotalPrice(),
        const SizedBox(
          height: 24,
        ),
        const CardInfo(),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.barcode,
                size: 50,
              ),
              Spacer(),
              PaidButton()
            ],
          ),
        ),
        SizedBox(
          height: ((MediaQuery.sizeOf(context).height * .13) / 2),
        )
      ],
    );
  }
}
