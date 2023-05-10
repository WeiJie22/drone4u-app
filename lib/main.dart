import 'package:drone4u/components/d4u_scaffold.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4u_login_screen.dart';
import 'package:drone4u/screens/d4u_navigation_bar.dart';
import 'package:drone4u/screens/d4u_sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: D4uRouter.generateRoute,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: d4uPrimaryColor),
      ),
      initialRoute: '/',
      home: const D4uSignUpPage(),
    );
  }
}
