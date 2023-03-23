import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uTextField extends StatefulWidget {
  D4uTextField({
    Key? key,
    this.placeHolder,
    this.suffixIcon,
    this.borderRadius,
    this.padding = D4uPadding.a16,
    //this.focusedBorderColor = const Color(0xFF000000),
  }) : super(key: key);

  String? placeHolder;
  Icon? suffixIcon;
  double? borderRadius;
  EdgeInsets padding;
  Color? focusedBorderColor;

  @override
  State<D4uTextField> createState() => _D4uTextFieldState();
}

class _D4uTextFieldState extends State<D4uTextField> {
  FocusNode focusNode = FocusNode();
  Color borderColor = d4uGray;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextField(
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: widget.placeHolder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 5),
            ),
          ),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
