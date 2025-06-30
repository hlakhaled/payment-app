import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 46,
      ),
      child: Row(
        children: List.generate(
            30,
            (_) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      color: const Color(0xFFB7B7B7),
                      height: 2,
                    ),
                  ),
                )),
      ),
    );
  }
}
