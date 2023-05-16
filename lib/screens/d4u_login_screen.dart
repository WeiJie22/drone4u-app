import 'package:drone4u/components/d4u_login_sub_text.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../components/d4u_index.dart';

class D4uLoginScreen extends StatefulWidget {
  const D4uLoginScreen({super.key});

  @override
  State<D4uLoginScreen> createState() => _D4uLoginScreenState();
}

class _D4uLoginScreenState extends State<D4uLoginScreen> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormBuilderState>();

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return D4uErrorDialog(
          title: "Login Error",
          content: errormessage,
        );
      },
    );
  }

  Future<void> signInWithEmailAndPassword(formValues) async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: formValues[LoginFormConstant.email],
        password: formValues[LoginFormConstant.password],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showError('Wrong password provided for that user.');
      }
    }
    Auth().authStateChanges.listen((user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.navigationBar,
          (route) => false,
          arguments: 0,
        );
      }
    });
  }

  Map<String, dynamic> formValues = {
    LoginFormConstant.email: '',
    LoginFormConstant.password: '',
  };

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      // bottomNavigationBarWidget: D4uBottomSocialMedia(
      //   text: "Or login with social account",
      // ),
      pageTitle: 'Login',
      body: FormBuilder(
        key: _formKey,
        initialValue: formValues,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            D4uTextField(
              onChanged: (_) {},

              name: LoginFormConstant.email,
              placeHolder: "Email",
              //TODO TO BE UNCOMMENTED AFTER TESTING
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ]),
            ),
            D4uTextField(
              onChanged: (_) {},

              name: LoginFormConstant.password,
              placeHolder: 'Password',
              obscureText: _isObscure,
              suffixIcon: visibilityIcon(),
              //TODO TO BE UNCOMMENTED AFTER TESTING
              // validator: FormBuilderValidators.required(),
            ),
            D4uLoginSubText(
              text: 'Forget your password? ',
              onPressed: () => {
                Navigator.pushNamed(context, RouteName.forgetPass),
              },
            ),
            D4uSingleButton(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              text: 'Login',
              onPressed: () => {
                if (_formKey.currentState?.saveAndValidate() ?? false)
                  {
                    signInWithEmailAndPassword(_formKey.currentState!.value),
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //   RouteName.navigationBar,
                    //   arguments: 1,
                    // )
                  }
              },
            ),
          ],
        ),
      ),
    );
  }

  IconButton visibilityIcon() {
    return IconButton(
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
    );
  }
}
