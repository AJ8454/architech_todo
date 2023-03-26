import 'package:architech_todo/src/app/features/authentication/presentation/pages/login_page.dart';
import 'package:architech_todo/src/app/features/home/presentation/pages/home_page.dart';
import 'package:architech_todo/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/routes/app_navigator.dart';
import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<SplashBloc>(context).add(GetUserLoggedEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state is LoadedSplashState) {
            if (state.isLog) {
              AppNavigator.pushReplace(context, HomePage.route);
            } else {
              AppNavigator.pushReplace(context, LoginPage.route);
            }
          }
        },
        child: Center(
          child: Text(
            AppStrings.appName,
            style: AppResponsive.responsiveTextStyle(
              context,
              fsize: AppResponsive.kmaxExtraLargeFont(context),
              fweight: FontWeight.bold,
              tColor: AppColor.blue,
            ),
          ),
        ),
      ),
    );
  }
}
