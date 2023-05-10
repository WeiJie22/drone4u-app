import 'package:drone4u/components/d4u_text.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class D4uErrorDialog extends StatelessWidget {
  D4uErrorDialog({
    Key? key,
    this.title = '',
    this.content = '',
  }) : super(key: key);

  String title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: D4uText(
        text: title,
        fontSize: 13,
        color: d4uGray,
        maxLines: 1,
      ),
      content: D4uText(
        text: content,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        maxLines: 3,
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Understand"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}





