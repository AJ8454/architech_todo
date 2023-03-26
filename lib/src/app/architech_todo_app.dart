import 'package:architech_todo/src/app/app_config_providers.dart';
import 'package:architech_todo/src/app/features/error/error_page.dart';
import 'package:architech_todo/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:architech_todo/src/core/routes/app_routers.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:architech_todo/src/core/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchitechToDoApp extends StatelessWidget {
  const ArchitechToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConfigProvider.blocProviders,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: (state is LightThemeState)
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
            initialRoute: "/",
            onGenerateRoute: AppRoute.router,
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return CustomError(errorDetails: errorDetails);
              };
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
