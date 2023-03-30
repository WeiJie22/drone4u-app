import 'package:flutter/material.dart';

const Color d4uPrimaryColor = Color(0xFFDB3022);
const Color d4uSecondaryColor = Color(0xFFFFFFFF);
const Color d4uGray = Color(0xFF9B9B9B);
const Color d4uBackground = Color(0xFFF9F9F9);
const Color d4uYellow = Color(0xFFFFBA49);

class D4uPadding {
  static const h16 = EdgeInsets.symmetric(horizontal: 16);
  static const v16 = EdgeInsets.symmetric(vertical: 16);
  static const a16 = EdgeInsets.all(16);

  static const h8 = EdgeInsets.symmetric(horizontal: 8);
  static const v8 = EdgeInsets.symmetric(vertical: 8);
  static const a8 = EdgeInsets.all(8);

  static const a24 = EdgeInsets.all(24);

  static const v4 = EdgeInsets.symmetric(vertical: 4);
  static const a4 = EdgeInsets.all(4);
  static const h4 = EdgeInsets.symmetric(horizontal: 4);

  static const t16 = EdgeInsets.only(top: 16);
  static const b16 = EdgeInsets.only(bottom: 16);
  static const l16 = EdgeInsets.only(left: 16);

  static const v2 = EdgeInsets.symmetric(vertical: 2);
  static const a2 = EdgeInsets.all(2);

  static const t8 = EdgeInsets.only(top: 8);
  static const b8 = EdgeInsets.only(bottom: 8);
  static const l8 = EdgeInsets.only(left: 8);

  static const t4 = EdgeInsets.only(top: 4);
  static const b4 = EdgeInsets.only(bottom: 4);
  static const r4 = EdgeInsets.only(right: 4);
  static const l4 = EdgeInsets.only(left: 4);

  static const containerCenter = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const containerCenter2 = EdgeInsets.fromLTRB(8, 4, 8, 4);
  static const containerCenter3 = EdgeInsets.fromLTRB(16, 0, 16, 8);
  static const containerCenter4 = EdgeInsets.fromLTRB(16, 8, 16, 0);
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class D4uSizedBox {
  static const shrink = SizedBox.shrink();
}
