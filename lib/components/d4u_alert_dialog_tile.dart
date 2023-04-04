import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';

class D4uAlertDialogTile extends StatelessWidget {
  D4uAlertDialogTile({
    Key? key,
    this.title = '',
    this.content = '',
  }) : super(key: key);

  String title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: D4uPadding.h16,
      child: Padding(
        padding: D4uPadding.v4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            D4uText(
              text: title,
              fontSize: 13,
              color: d4uGray,
              maxLines: 1,
            ),
            D4uText(
              text: content,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
