import 'package:drone4u/screens/d4uCatalogFilterPage.dart';
import 'package:drone4u/screens/d4uCatalogPage.dart';
import 'package:drone4u/screens/d4uForgotPassPage.dart';
import 'package:drone4u/screens/d4uLoginScreen.dart';
import 'package:drone4u/screens/d4uNavigationBar.dart';
import 'package:drone4u/screens/d4uServiceDetailPage.dart';
import 'package:drone4u/screens/d4uSignUpPage.dart';

class RouteName {
  static const signUp = '/signUp';
  static const loginPage = '/login';
  static const forgetPass = '/forgetPass';
  static const naviagtionBar = '/naviagtionBar';
  static const catalogFilterPage = '/catalogFilterPage';
  static const catalogPage = '/catalogPage';
  static const servcieDetailPage = '/servcieDetailPage';
}

d4uRoutes(context) => {
      RouteName.signUp: (context) => const D4uSignUpPage(),
      RouteName.loginPage: (context) => const D4uLoginScreen(),
      RouteName.forgetPass: (context) => const D4uForgotPassPage(),
      RouteName.naviagtionBar: (context) => const D4uNavigationBar(),
      RouteName.catalogFilterPage: (context) => const D4uatalogFilterPage(),
      RouteName.catalogPage: (context) => D4uCatalogPage(),
      RouteName.servcieDetailPage: (context) => const D4uServiceDetailPage(),
    };
