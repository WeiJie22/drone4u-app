import 'package:drone4u/screens/d4uCatalogFilterPage.dart';
import 'package:drone4u/screens/d4uCatalogPage.dart';
import 'package:drone4u/screens/d4uForgotPassPage.dart';
import 'package:drone4u/screens/d4uLoginScreen.dart';
import 'package:drone4u/screens/d4uNavigationBar.dart';
import 'package:drone4u/screens/d4uOrderDetailsPage.dart';
import 'package:drone4u/screens/d4uServiceDetailPage.dart';
import 'package:drone4u/screens/d4uSignUpPage.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const signUp = '/signUp';
  static const loginPage = '/login';
  static const forgetPass = '/forgetPass';
  static const navigationBar = '/navigationBar';
  static const catalogFilterPage = '/catalogFilterPage';
  static const catalogPage = '/catalogPage';
  static const serviceDetailPage = '/serviceDetailPage';
  static const orderDetailsPage = '/orderDetailsPage';
}

class D4uRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.signUp:
        return MaterialPageRoute(
          builder: (_) => const D4uSignUpPage(),
        );
      case RouteName.loginPage:
        return MaterialPageRoute(
          builder: (_) => const D4uLoginScreen(),
        );
      case RouteName.forgetPass:
        return MaterialPageRoute(
          builder: (_) => const D4uForgotPassPage(),
        );
      case RouteName.navigationBar:
        int index = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => D4uNavigationBar(
            selectedIndex: index,
          ),
        );
      case RouteName.catalogFilterPage:
        return MaterialPageRoute(
          builder: (_) => const D4uCatalogFilterPage(),
        );
      case RouteName.catalogPage:
        D4uCatalogPageArguments args =
            settings.arguments as D4uCatalogPageArguments;
        return MaterialPageRoute(
          builder: (_) => D4uCatalogPage(
            arg: args,
          ),
        );
      case RouteName.serviceDetailPage:
        D4uServiceDetailPageArgs args =
            settings.arguments as D4uServiceDetailPageArgs;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => D4uServiceDetailPage(
            args: args,
          ),
        );
      case RouteName.orderDetailsPage:
        D4uOrderDetailsPageArgs args =
            settings.arguments as D4uOrderDetailsPageArgs;
        return MaterialPageRoute(
          builder: (_) => D4uOrderDetailsPage(
            args: args,
          ),
        );
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}

// d4uRoutes(context) => {
//       RouteName.signUp: (context) => const D4uSignUpPage(),
//       RouteName.loginPage: (context) => const D4uLoginScreen(),
//       RouteName.forgetPass: (context) => const D4uForgotPassPage(),
//       RouteName.naviagtionBar: (context) => const D4uNavigationBar(),
//       RouteName.catalogFilterPage: (context) => const D4uatalogFilterPage(),
//       RouteName.catalogPage: (context) => D4uCatalogPage(),
//       RouteName.servcieDetailPage: (context) => const D4uServiceDetailPage(),
//       RouteName.orderDetailsPage: (context) => const D4uOrderDetailsPage(),
//     };
