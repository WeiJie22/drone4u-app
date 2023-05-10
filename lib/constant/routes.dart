import 'package:drone4u/screens/d4u_catalog_filter_page.dart';
import 'package:drone4u/screens/d4u_catalog_page.dart';
import 'package:drone4u/screens/d4u_confirm_booking_page.dart';
import 'package:drone4u/screens/d4u_forgot_pass_page.dart';
import 'package:drone4u/screens/d4u_login_screen.dart';
import 'package:drone4u/screens/d4u_my_profile_page.dart';
import 'package:drone4u/screens/d4u_navigation_bar.dart';
import 'package:drone4u/screens/d4u_order_details_page.dart';
import 'package:drone4u/screens/d4u_service_detail_page.dart';
import 'package:drone4u/screens/d4u_settings_page.dart';
import 'package:drone4u/screens/d4u_sign_up_page.dart';
import 'package:drone4u/screens/d4u_success_booking_page.dart';
import 'package:drone4u/screens/d4u_upload_service.dart';
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
  static const successBookingPage = '/successBookingPage';
  static const myProfilePage = '/myProfilePage';
  static const settingsPage = '/settingsPage';
  static const uploadPage = '/uploadPage';
  static const confirmBookingPage = '/confirmBookingPage';
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
      case RouteName.successBookingPage:
        return MaterialPageRoute(
          builder: (_) => const D4uSuccessBookingPage(),
        );
      case RouteName.myProfilePage:
        return MaterialPageRoute(
          builder: (_) => D4uMyProfilePage(),
        );
      case RouteName.settingsPage:
        return MaterialPageRoute(
          builder: (_) => const D4uSettingsPage(),
        );
      case RouteName.uploadPage:
        return MaterialPageRoute(
          builder: (_) => const D4uUploadPage(),
        );
      case RouteName.confirmBookingPage:
        return MaterialPageRoute(
          builder: (_) => const D4uConfirmBookingPage(),
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
