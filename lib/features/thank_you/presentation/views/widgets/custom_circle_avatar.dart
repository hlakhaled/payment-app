
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundColor: Color(0xffEDEDED),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xFF34A853),
        child: Icon(
          FontAwesomeIcons.check,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
