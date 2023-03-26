import 'dart:developer';

import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? router(RouteSettings settings) {
    final dynamic arguments = settings.arguments;
    log("navigating ${settings.name}");
    switch (settings.name) {
      // case SplashPage.route:
      //   return MaterialPageRoute(builder: (context) => const SplashPage());

      // case AuthPage.route:
      //   return MaterialPageRoute(builder: (context) => const AuthPage());

      // case SignUpLoginPage.route:
      //   return MaterialPageRoute(
      //       builder: (context) => SignUpLoginPage(data: arguments));

      // case WebViewWidget.route:
      //   return MaterialPageRoute(
      //       builder: (context) => WebViewWidget(data: arguments));

      // case AppBottomNavigationBar.route:
      //   return MaterialPageRoute(
      //       builder: (context) => const AppBottomNavigationBar());

      // case SearchPage.route:
      //   return MaterialPageRoute(
      //       builder: (context) => SearchPage(data: arguments));

      // case PollQuizPage.route:
      //   return MaterialPageRoute(builder: (context) => const PollQuizPage());
    }
    return null;
  }
}
