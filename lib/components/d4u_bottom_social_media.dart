import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class D4uBottomSocialMedia extends StatelessWidget {
  D4uBottomSocialMedia({super.key, this.text = ''});

  String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        D4uText(
          padding: D4uPadding.containerCenter,
          text: text,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              shadowColor: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SvgPicture.asset(
                  'assets/google.svg',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              shadowColor: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SvgPicture.asset(
                  'assets/facebook.svg',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 36,
        )
      ],
    );
  }
}
