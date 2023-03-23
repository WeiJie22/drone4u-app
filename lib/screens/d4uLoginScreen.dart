import 'package:drone4u/components/d4uDuoButton.dart';
import 'package:drone4u/components/d4uScaffold.dart';
import 'package:drone4u/components/d4uLoginSubText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/d4uIndex.dart';

class D4uLoginScreen extends StatefulWidget {
  const D4uLoginScreen({super.key});

  @override
  State<D4uLoginScreen> createState() => _D4uLoginScreenState();
}

class _D4uLoginScreenState extends State<D4uLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      color: d4uBackground,
      bottomNavigationBarWidget: D4uBottomSocialMedia(
        text: "Or login with social account",
      ),
      pageTitle: 'Login',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 50,
          ),
          D4uTextField(
            placeHolder: "Name",
          ),
          D4uTextField(
            placeHolder: 'Password',
          ),
          D4uLoginSubText(
            text: 'Forget your password? ',
            onPressed: () => {},
          ),
          D4uSingleButton(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
