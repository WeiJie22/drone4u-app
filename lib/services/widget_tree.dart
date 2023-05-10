import 'auth.dart';

import 'package:drone4u/screens/d4u_navigation_bar.dart';
import 'package:drone4u/screens/d4u_sign_up_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const D4uNavigationBar();
        } else {
          return const D4uSignUpPage();
        }
      },
    );
  }
}
