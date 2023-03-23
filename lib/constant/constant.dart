import 'package:flutter/material.dart';

const Color d4uPrimaryColor = Color(0xFFDB3022);
const Color d4uSecondaryColor = Color(0xFFFFFFFF);
const Color d4uGray = Color(0xFF9B9B9B);
const Color d4uBackground = Color(0xFFF9F9F9);

class D4uPadding {
  static const h16 = EdgeInsets.symmetric(horizontal: 16);
  static const v16 = EdgeInsets.symmetric(vertical: 16);
  static const a16 = EdgeInsets.all(16);

  static const h8 = EdgeInsets.symmetric(horizontal: 8);
  static const v8 = EdgeInsets.symmetric(vertical: 8);
  static const a8 = EdgeInsets.all(8);

  static const containerCenter = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const containerCenter2 = EdgeInsets.fromLTRB(8, 4, 8, 4);
  static const containerCenter3 = EdgeInsets.fromLTRB(16, 0, 16, 8);
  static const containerCenter4 = EdgeInsets.fromLTRB(16, 8, 16, 0);
}

class d4uSizedBox {
  static const shrink = SizedBox.shrink();
}