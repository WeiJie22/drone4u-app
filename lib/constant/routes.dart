import 'package:drone4u/screens/d4uForgotPassPage.dart';
import 'package:drone4u/screens/d4uLoginScreen.dart';
import 'package:drone4u/screens/d4uSignUpPage.dart';

class RouteName {
  static const signUp = '/signUp';
  static const loginPage = '/login';
  static const forgetPass = '/forgetPass';
}

d4uRoutes(context) => {
      RouteName.signUp: (context) => D4uSignUpPage(),
      RouteName.loginPage: (context) => D4uLoginScreen(),
      RouteName.forgetPass: (context) => D4uForgotPassPage(),
    };
