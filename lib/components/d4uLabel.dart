import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';

enum LabelType { bordered, filled }

class D4uLabel extends StatelessWidget {
  D4uLabel({
    Key? key,
    required this.labelText,
    this.labelColor = d4uPrimaryColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 10,
    this.padding = D4uPadding.h16,
    this.labelType = LabelType.filled,
  }) : super(key: key);

  String labelText;
  Color? labelColor;
  FontWeight? fontWeight;
  double? fontSize;
  EdgeInsets padding;
  LabelType labelType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          padding: D4uPadding.containerCenter2,
          decoration: labelType == LabelType.filled
              ? BoxDecoration(
                  color: d4uPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: d4uPrimaryColor,
                    width: 1,
                  ),
                  color: d4uSecondaryColor,
                ),
          child: Center(
            child: D4uText(
              text: labelText,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: labelType == LabelType.filled
                  ? d4uSecondaryColor
                  : d4uPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
