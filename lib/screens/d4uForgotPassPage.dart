import 'package:drone4u/components/d4uLoginSubText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/screens/d4uLoginScreen.dart';
import 'package:flutter/material.dart';
import '../components/d4uIndex.dart';

class D4uForgotPassPage extends StatefulWidget {
  const D4uForgotPassPage({super.key});

  @override
  State<D4uForgotPassPage> createState() => _D4uForgotPassPageState();
}

class _D4uForgotPassPageState extends State<D4uForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      color: d4uBackground,
      pageTitle: 'Forgot password',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: D4uPadding.containerCenter,
            child: D4uText(
              text:
                  'Please, enter your email address. You will receive a link to create a new password via email.',
            ),
          ),
          D4uTextField(
            placeHolder: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          D4uSingleButton(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            text: 'Send',
          ),
        ],
      ),
    );
  }
}
