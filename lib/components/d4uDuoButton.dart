import 'package:flutter/material.dart';
import '../constant/constant.dart';
import 'd4uIndex.dart';

class D4uDuoButton extends StatelessWidget {
  D4uDuoButton({
    super.key,
    this.primaryText,
    this.secondaryText,
    this.primaryCallback,
    this.secondaryCallback,
    this.primaryFlex = 6,
    this.secondaryFlex = 4,
    this.padding = D4uPadding.containerCenter,
  });

  String? primaryText;
  String? secondaryText;
  VoidCallback? primaryCallback;
  VoidCallback? secondaryCallback;
  int primaryFlex;
  int secondaryFlex;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            flex: secondaryFlex,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: d4uPrimaryColor,
                  ),
                ),
                minimumSize: const Size.fromHeight(48),
                backgroundColor: d4uBackground,
              ),
              child: D4uText(
                text: secondaryText!.toUpperCase(),
                color: d4uPrimaryColor,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: primaryFlex,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                minimumSize: const Size.fromHeight(48),
                backgroundColor: d4uPrimaryColor,
              ),
              child: D4uText(
                text: primaryText!.toUpperCase(),
                color: d4uSecondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
