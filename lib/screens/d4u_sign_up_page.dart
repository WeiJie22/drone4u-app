import 'package:drone4u/components/d4u_login_sub_text.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/utils/form_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../components/d4u_index.dart';
import '../services/auth.dart';

class D4uSignUpPage extends StatefulWidget {
  const D4uSignUpPage({super.key});

  @override
  State<D4uSignUpPage> createState() => _D4uSignUpPageState();
}

class _D4uSignUpPageState extends State<D4uSignUpPage> {
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  final _formKey = GlobalKey<FormBuilderState>();

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Up Error'),
          content: Text(errormessage),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }

  Future<void> createUserWithEmailAndPassword(formValues) async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: formValues[SignUpFormConstant.email],
        password: formValues[SignUpFormConstant.password],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (e.code == 'weak-password') {
          showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showError('The account already exists for that email.');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> formValues = {
    SignUpFormConstant.name: '',
    SignUpFormConstant.email: '',
    SignUpFormConstant.password: '',
    SignUpFormConstant.confirmPassword: '',
  };

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
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
              onChanged: (_) {},
              name: SignUpFormConstant.name,
              placeHolder: "Name",
              validator: FormBuilderValidators.required(),
            ),
            D4uTextField(
              onChanged: (_) {},
              name: SignUpFormConstant.email,
              placeHolder: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            D4uTextField(
              onChanged: (_) {},
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
              onChanged: (_) {},
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
                  {
                    createUserWithEmailAndPassword(
                      _formKey.currentState!.value,
                    ),
                    debugPrint(_formKey.currentState?.value.toString()),
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
