import 'package:flutter/material.dart';

class D4uText extends StatelessWidget {
  D4uText({
    Key? key,
    this.text = '',
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.color = Colors.black,
  }) : super(key: key);

  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: overflow,
      ),
    );
  }
}
