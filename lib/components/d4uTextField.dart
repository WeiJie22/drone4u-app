import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uTextField extends StatefulWidget {
  D4uTextField({
    Key? key,
    this.placeHolder,
    this.suffixIcon,
    this.borderRadius,
    this.padding = D4uPadding.containerCenter,
    this.keyboardType,
  }) : super(key: key);

  String? placeHolder;
  Icon? suffixIcon;
  double? borderRadius;
  EdgeInsets padding;
  Color? focusedBorderColor;
  TextInputType? keyboardType;

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 12.0,
              color: Colors.black.withOpacity(0.05),
            ),
          ],
        ),
        child: TextField(
          keyboardType: widget.keyboardType,
          cursorColor: Colors.black,
          cursorWidth: 1,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.placeHolder,
            labelStyle: const TextStyle(color: d4uGray),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: d4uSecondaryColor),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: d4uSecondaryColor),
              borderRadius: BorderRadius.circular(12.0),
            ),
            fillColor: d4uSecondaryColor,
            filled: true,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
