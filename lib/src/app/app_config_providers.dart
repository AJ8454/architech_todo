import 'package:architech_todo/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:architech_todo/src/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:architech_todo/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:architech_todo/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:architech_todo/src/app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architech_todo/src/injection_container.dart' as di;

class AppConfigProvider {
  static get blocProviders {
    return [
      BlocProvider(
          create: (context) => di.sl<ThemeBloc>()..add(InitialThemeSetEvent())),
      BlocProvider(create: (context) => di.sl<SplashBloc>()),
      BlocProvider(create: (context) => di.sl<AuthenticationBloc>()),
      BlocProvider(create: (context) => di.sl<HomeBloc>()),
      BlocProvider(create: (context) => di.sl<TodoBloc>()),
    ];
  }
}
