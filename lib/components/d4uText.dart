import 'package:flutter/material.dart';

class D4uText extends StatelessWidget {
  D4uText({
    Key? key,
    this.text = '',
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.overflow,
    this.textDecoration,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  String? text;
  double? fontSize;
  int? maxLines;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  TextDecoration? textDecoration;
  Color? color;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text!,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: overflow,
          decoration: textDecoration,
        ),
      ),
    );
  }
}
