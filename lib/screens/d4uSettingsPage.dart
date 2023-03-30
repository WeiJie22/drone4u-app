import 'package:drone4u/components/d4uIndex.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/formConstant.dart';
import 'package:drone4u/screens/d4uChangePasswordModalBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class D4uSettingsPage extends StatefulWidget {
  const D4uSettingsPage({super.key});

  @override
  State<D4uSettingsPage> createState() => _D4uSettingsPageState();
}

class _D4uSettingsPageState extends State<D4uSettingsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> formValues = {
    SettingConstant.fullName: '',
    SettingConstant.date: DateTime.now(),
    SettingConstant.password: 'asdfasdfasdf',
  };

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      showBackButton: true,
      pageTitle: "Settings",
      body: FormBuilder(
        key: _formKey,
        initialValue: formValues,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            D4uText(
              padding: D4uPadding.a16,
              text: 'Personal Information',
              textStyle: D4uTextStyle.h3,
            ),
            D4uTextField(
              name: SettingConstant.fullName,
              placeHolder: "Full Name",
              validator: FormBuilderValidators.required(),
            ),
            D4uDateTimePicker(
              name: SettingConstant.date,
              placeHolder: "Date of Birth",
              validator: FormBuilderValidators.required(),
              suffixIcon: const Icon(Icons.calendar_month_outlined),
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                D4uText(
                  padding: D4uPadding.a16,
                  text: 'Password',
                  textStyle: D4uTextStyle.h3,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) =>
                          D4uChangePasswordModalBottomSheet(context),
                    );
                  },
                  child: D4uText(
                    padding: D4uPadding.a16,
                    text: 'Change Password',
                    textStyle: D4uTextStyle.labelText,
                  ),
                ),
              ],
            ),
            D4uTextField(
              name: LoginFormConstant.password,
              placeHolder: 'Password',
              obscureText: _isObscure,
              suffixIcon: visibilityIcon(),
              validator: FormBuilderValidators.required(),
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
