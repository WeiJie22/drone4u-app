import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uCircularButton extends StatefulWidget {
  D4uCircularButton({
    super.key,
    this.icon = Icons.favorite,
    this.onPressed,
    this.active = false,
  });

  IconData icon;
  Function? onPressed;
  bool? active;

  @override
  State<D4uCircularButton> createState() => _D4uCircularButtonState();
}

class _D4uCircularButtonState extends State<D4uCircularButton> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _active = !_active;
        });
        widget.onPressed!(_active);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: d4uSecondaryColor,
        foregroundColor: d4uBackground,
      ),
      child: widget.active!
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
