import 'package:flutter/material.dart';

class D4uText extends StatelessWidget {
  D4uText({
    Key? key,
    this.text = '',
    this.fontSize,
    this.letterSpacing,
    this.height,
    this.maxLines,
    this.softWrap,
    this.fontWeight,
    this.overflow,
    this.textDecoration,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
    this.textStyle,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  String? text;
  double? fontSize;
  double? letterSpacing;
  double? height;
  int? maxLines;
  bool? softWrap;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  TextDecoration? textDecoration;
  Color? color;
  EdgeInsets padding;
  TextStyle? textStyle;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text!,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: textStyle ??
            TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: overflow,
              decoration: textDecoration,
              letterSpacing: letterSpacing,
              height: height,
            ),
      ),
    );
  }
}
