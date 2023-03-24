import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uTextField extends StatefulWidget {
  D4uTextField({
    Key? key,
    @required this.name,
    this.placeHolder,
    this.suffixIcon,
    this.borderRadius,
    this.padding = D4uPadding.containerCenter,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  String? placeHolder;
  IconButton? suffixIcon;
  double? borderRadius;
  EdgeInsets padding;
  Color? focusedBorderColor;
  TextInputType? keyboardType;
  bool obscureText;
  int? maxLines;
  Function? onChanged;
  String? name;
  String? Function(String?)? validator;
  @override
  State<D4uTextField> createState() => _D4uTextFieldState();
}

class _D4uTextFieldState extends State<D4uTextField> {
  late FocusNode focusNode;
  Color borderColor = d4uGray;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

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
        child: FormBuilderTextField(
          name: widget.name ?? '',
          onChanged: ((value) => widget.onChanged!(value)),
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: Colors.black,
          cursorWidth: 1,
          focusNode: focusNode,
          validator: widget.validator,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
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
