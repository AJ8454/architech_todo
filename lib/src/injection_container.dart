import 'package:architech_todo/src/app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:architech_todo/src/app/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:architech_todo/src/app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:architech_todo/src/app/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:architech_todo/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:architech_todo/src/app/features/splash/data/datasources/local_data_source.dart';
import 'package:architech_todo/src/app/features/splash/data/repositories/splash_repo_impl.dart';
import 'package:architech_todo/src/app/features/splash/domain/repositories/splash_repo.dart';
import 'package:architech_todo/src/app/features/splash/domain/usecases/splash_usecase.dart';
import 'package:architech_todo/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:architech_todo/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:architech_todo/src/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //---------- for Theme -----------------------------------------------
  sl.registerFactory(() => ThemeBloc());
  //---------- for Splash -----------------------------------------------

  // Bloc
  sl.registerFactory(() => SplashBloc(splashUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => SplashUsecase(sl()));
  // Reposiroty
  sl.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(splashLocalDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImpl(sharedPreference: sl()));

  //---------- for Auth -----------------------------------------------

  // Bloc
  sl.registerFactory(() => AuthenticationBloc(authUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => AuthUsecase(sl()));
  // Reposiroty
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(localDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl());

  //---------- for core -----------------------------------------------
  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//---------------------------------------------------------------------------
  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

//---------------------------------------------------------------------------
}
