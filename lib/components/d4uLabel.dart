import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';

class D4uLabel extends StatelessWidget {
  D4uLabel({
    Key? key,
    required this.labelText,
    this.labelColor = d4uPrimaryColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 10,
    this.padding = D4uPadding.h16,
  }) : super(key: key);

  String labelText;
  Color? labelColor;
  FontWeight? fontWeight;
  double? fontSize;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          padding: D4uPadding.containerCenter2,
          decoration: BoxDecoration(
            color: d4uPrimaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: D4uText(
              text: labelText,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: d4uSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
