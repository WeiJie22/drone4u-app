import 'package:drone4u/components/d4uScaffold.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4uLoginScreen.dart';
import 'package:drone4u/screens/d4uNavigationBar.dart';
import 'package:drone4u/screens/d4uSignUpPage.dart';
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
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: d4uPrimaryColor),
      ),
      routes: d4uRoutes(context),
      initialRoute: '/',
      home: const D4uSignUpPage(),
    );
  }
}
