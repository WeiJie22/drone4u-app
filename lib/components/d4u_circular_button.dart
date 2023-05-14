import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uCircularButton extends StatefulWidget {
  D4uCircularButton({
    super.key,
    this.icon = Icons.favorite,
    this.onPressed,
  });

  IconData icon;
  VoidCallback? onPressed;

  @override
  State<D4uCircularButton> createState() => _D4uCircularButtonState();
}

class _D4uCircularButtonState extends State<D4uCircularButton> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: d4uSecondaryColor, // <-- Button color
        foregroundColor: d4uBackground, // <-- Splash color
      ),
      child: _active
          ? Icon(
              widget.icon,
              color: d4uPrimaryColor,
              size: 18,
            )
          : Icon(
              widget.icon,
              color: d4uGray,
              size: 18,
            ),
    );
  }
}
