import 'dart:developer';

import 'package:architech_todo/src/app/features/authentication/presentation/pages/forget_password_page.dart';
import 'package:architech_todo/src/app/features/authentication/presentation/pages/login_page.dart';
import 'package:architech_todo/src/app/features/authentication/presentation/pages/signup_page.dart';
import 'package:architech_todo/src/app/features/home/presentation/pages/home_page.dart';
import 'package:architech_todo/src/app/features/splash/presentation/pages/splash_page.dart';
import 'package:architech_todo/src/app/features/todo/presentation/pages/all_tasks_page.dart';
import 'package:architech_todo/src/app/features/todo/presentation/pages/edit_task.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? router(RouteSettings settings) {
    final dynamic arguments = settings.arguments;
    log("navigating ${settings.name}");
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (context) => const SplashPage());

      case LoginPage.route:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case ForgetPasswordPage.route:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordPage());

      case SignUpPage.route:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case HomePage.route:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case AllTaskPage.route:
        return MaterialPageRoute(builder: (context) => const AllTaskPage());

      case EditTasksPage.route:
        return MaterialPageRoute(
            builder: (context) => EditTasksPage(data: arguments));

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
