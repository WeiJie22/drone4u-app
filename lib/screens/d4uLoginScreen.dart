import 'package:drone4u/components/d4uScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      pageTitle: 'Login',
      body: Column(
        children: [
          D4uTextField(
            placeHolder: "Name",
          ),
          D4uTextField(
            placeHolder: 'Password',
          ),
        ],
      ),
    );
  }
}
