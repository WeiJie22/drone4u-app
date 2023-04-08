import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uSingleButton extends StatelessWidget {
  const D4uSingleButton({
    super.key,
    this.padding = D4uPadding.containerCenter,
    this.text = '',
    this.onPressed,
    this.elevation = false,
  });

  final EdgeInsets padding;
  final String? text;
  final VoidCallback? onPressed;
  final bool elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: d4uBackground,
        boxShadow: [
          if (elevation)
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
        ],
      ),
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
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
