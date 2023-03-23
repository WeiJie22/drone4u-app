import 'package:drone4u/components/d4uLoginSubText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/screens/d4uLoginScreen.dart';
import 'package:flutter/material.dart';
import '../components/d4uIndex.dart';

class D4uSignUpPage extends StatefulWidget {
  const D4uSignUpPage({super.key});

  @override
  State<D4uSignUpPage> createState() => _D4uSignUpPageState();
}

class _D4uSignUpPageState extends State<D4uSignUpPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      color: d4uBackground,
      bottomNavigationBarWidget: D4uBottomSocialMedia(
        text: "Or sign up with social account",
      ),
      pageTitle: 'Sign Up',
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
            placeHolder: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          D4uTextField(
            placeHolder: 'Password',
            obscureText: _isObscure,
            suffixIcon: IconButton(
              splashRadius: 1,
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: d4uPrimaryColor,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
          D4uTextField(
            placeHolder: 'Confirm Password',
            obscureText: _isObscure,
            suffixIcon: IconButton(
              splashRadius: 1,
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: d4uPrimaryColor,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
          D4uLoginSubText(
            text: 'Already have an account? ',
            onPressed: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => D4uLoginScreen()))
            },
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
