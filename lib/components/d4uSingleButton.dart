import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uSingleButton extends StatelessWidget {
  D4uSingleButton({
    super.key,
    this.padding = D4uPadding.containerCenter,
    this.text = '',
    this.onPressed,
  });

  EdgeInsets padding;
  String? text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shadowColor: d4uPrimaryColor,
          elevation: 2,
          shape: const StadiumBorder(),
          minimumSize: const Size.fromHeight(48),
          backgroundColor: d4uPrimaryColor,
        ),
        child: D4uText(
          text: text!.toUpperCase(),
          fontWeight: FontWeight.bold,
          color: d4uSecondaryColor,
        ),
      ),
    );
  }
}
