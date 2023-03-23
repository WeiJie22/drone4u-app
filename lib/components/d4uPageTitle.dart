import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uPageTitle extends StatelessWidget {
  D4uPageTitle({
    Key? key,
    @required this.title,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 34,
    this.overflow = TextOverflow.clip,
  }) : super(key: key);

  String? title;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: D4uPadding.h16,
      child: Text(
        title ?? '',
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: overflow,
        ),
      ),
    );
  }
}
