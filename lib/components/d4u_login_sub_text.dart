import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

import 'd4u_index.dart';

class D4uLoginSubText extends StatelessWidget {
  D4uLoginSubText({
    super.key,
    this.text,
    this.onPressed,
  });

  String? text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: D4uPadding.containerCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            D4uText(
              text: text,
            ),
            const Icon(
              Icons.arrow_right_alt,
              color: d4uPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
