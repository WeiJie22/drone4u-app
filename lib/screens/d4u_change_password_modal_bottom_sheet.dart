import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../components/d4u_index.dart';

class D4uChangePasswordModalBottomSheet extends StatefulWidget {
  const D4uChangePasswordModalBottomSheet(BuildContext context, {super.key});

  @override
  State<D4uChangePasswordModalBottomSheet> createState() =>
      _D4uChangePasswordModalBottomSheetState();
}

class _D4uChangePasswordModalBottomSheetState
    extends State<D4uChangePasswordModalBottomSheet> {
  final _fbKey = GlobalKey<FormBuilderState>();

  bool oldPassObscure = true;
  bool newPassObscure = true;
  bool confirmPassObscure = true;

  Map<String, dynamic> formValues = {
    ChangePassConstant.oldPassword: '',
    ChangePassConstant.newPassword: '',
    ChangePassConstant.confirmPassword: '',
  };

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: FormBuilder(
                key: _fbKey,
                initialValue: formValues,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 6,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                          ),
                          D4uText(
                            text: 'Password Change',
                            fontWeight: FontWeight.bold,
                            padding: D4uPadding.a16,
                            textStyle: D4uTextStyle.h2,
                          ),
                          const SizedBox(
                            height: 18,
                          )
                        ],
                      ),
                    ),
                    D4uTextField(
                      name: ChangePassConstant.oldPassword,
                      placeHolder: 'Old Password',
                      obscureText: oldPassObscure,
                      suffixIcon: IconButton(
                        splashRadius: 1,
                        icon: Icon(
                          oldPassObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: d4uPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            oldPassObscure = !oldPassObscure;
                          });
                        },
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(
                          context,
                          RouteName.forgetPass,
                        );
                      },
                      child: D4uText(
                        padding: D4uPadding.containerCenter3,
                        text: 'Forget Password?',
                        textAlign: TextAlign.end,
                        textStyle: D4uTextStyle.labelText,
                      ),
                    ),
                    D4uTextField(
                      name: ChangePassConstant.newPassword,
                      placeHolder: 'New Password',
                      obscureText: newPassObscure,
                      suffixIcon: IconButton(
                        splashRadius: 1,
                        icon: Icon(
                          newPassObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: d4uPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            newPassObscure = !newPassObscure;
                          });
                        },
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    D4uTextField(
                      name: ChangePassConstant.confirmPassword,
                      placeHolder: 'Confirm Password',
                      obscureText: confirmPassObscure,
                      suffixIcon: IconButton(
                        splashRadius: 1,
                        icon: Icon(
                          confirmPassObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: d4uPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            confirmPassObscure = !confirmPassObscure;
                          });
                        },
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    D4uSingleButton(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      text: 'Save Password'.toUpperCase(),
                      onPressed: () {
                        if (_fbKey.currentState?.saveAndValidate() ?? false) {
                          print(_fbKey.currentState!.value);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
