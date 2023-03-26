import 'package:architech_todo/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:architech_todo/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architech_todo/src/injection_container.dart' as di;

class AppConfigProvider {
  static get blocProviders {
    return [
      BlocProvider(
          create: (context) => di.sl<ThemeBloc>()..add(InitialThemeSetEvent())),
      BlocProvider(create: (context) => di.sl<SplashBloc>()),
    ];
  }
}
