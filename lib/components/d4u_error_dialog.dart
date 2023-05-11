import 'package:drone4u/components/d4u_text.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../constant/routes.dart';

class D4uErrorDialog extends StatelessWidget {
  D4uErrorDialog({
    Key? key,
    this.title = '',
    this.content = '',
    this.refresh = false,
  }) : super(key: key);

  String title;
  String? content;
  bool refresh;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: D4uText(
        text: title,
        fontSize: 13,
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
          onPressed: refresh
              ? () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.navigationBar,
                    (route) => false,
                    arguments: 0,
                  )
              : () => Navigator.of(context).pop(),
          child: const Text("Understand"),
        ),
      ],
    );
  }
}
