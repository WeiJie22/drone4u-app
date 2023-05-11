import 'package:drone4u/components/d4u_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uLoadingDialog extends StatelessWidget {
  const D4uLoadingDialog({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 20,
            ),
            D4uText(
              text: text ?? "Loading...",
            )
          ],
        ),
      ),
    );
  }
}
