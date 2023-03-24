import 'package:drone4u/components/d4uLoginSubText.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/utils/formUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../components/d4uIndex.dart';

class D4uSignUpPage extends StatefulWidget {
  const D4uSignUpPage({super.key});

  @override
  State<D4uSignUpPage> createState() => _D4uSignUpPageState();
}

class _D4uSignUpPageState extends State<D4uSignUpPage> {
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    SignUpFormConstant.name: '',
    SignUpFormConstant.email: '',
    SignUpFormConstant.password: '',
    SignUpFormConstant.confirmPassword: '',
  };

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      color: d4uBackground,
      bottomNavigationBarWidget: D4uBottomSocialMedia(
        text: "Or sign up with social account",
      ),
      pageTitle: 'Sign Up',
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
              name: SignUpFormConstant.name,
              placeHolder: "Name",
              validator: FormBuilderValidators.required(),
            ),
            D4uTextField(
              name: SignUpFormConstant.email,
              placeHolder: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            D4uTextField(
              name: SignUpFormConstant.password,
              placeHolder: 'Password',
              obscureText: passwordObscure,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(8),
              ]),
              suffixIcon: IconButton(
                splashRadius: 1,
                icon: Icon(
                  passwordObscure ? Icons.visibility_off : Icons.visibility,
                  color: d4uPrimaryColor,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    passwordObscure = !passwordObscure;
                  });
                },
              ),
            ),
            D4uTextField(
              name: SignUpFormConstant.confirmPassword,
              placeHolder: 'Confirm Password',
              obscureText: confirmPasswordObscure,
              suffixIcon: IconButton(
                splashRadius: 1,
                icon: Icon(
                  confirmPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: d4uPrimaryColor,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    confirmPasswordObscure = !confirmPasswordObscure;
                  });
                },
              ),
              validator: (val) {
                if (FormUtils.getValueBasedOnFieldName(
                        _formKey, SignUpFormConstant.password) !=
                    val) {
                  return "Make sure your passwords are the same";
                }
                return null;
              },
            ),
            D4uLoginSubText(
              text: 'Already have an account? ',
              onPressed: () => {
                Navigator.pushNamed(context, RouteName.loginPage),
              },
            ),
            D4uSingleButton(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              text: 'Sign Up',
              onPressed: () => {
                if (_formKey.currentState?.saveAndValidate() ?? false)
                  {debugPrint(_formKey.currentState?.value.toString())}
              },
            ),
          ],
        ),
      ),
    );
  }
}
