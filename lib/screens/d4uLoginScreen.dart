import 'package:drone4u/components/d4uLoginSubText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../components/d4uIndex.dart';

class D4uLoginScreen extends StatefulWidget {
  const D4uLoginScreen({super.key});

  @override
  State<D4uLoginScreen> createState() => _D4uLoginScreenState();
}

class _D4uLoginScreenState extends State<D4uLoginScreen> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    LoginFormConstant.email: '',
    LoginFormConstant.password: '',
  };

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      bottomNavigationBarWidget: D4uBottomSocialMedia(
        text: "Or login with social account",
      ),
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
              name: LoginFormConstant.email,
              placeHolder: "Email",
              //TODO TO BE UNCOMMENTED AFTER TESTING
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ]),
            ),
            D4uTextField(
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
                    Navigator.pushNamed(context, RouteName.naviagtionBar),
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
