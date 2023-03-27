import 'package:architech_todo/src/app/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:architech_todo/src/app/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:architech_todo/src/app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:architech_todo/src/app/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:architech_todo/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:architech_todo/src/app/features/home/data/datasources/home_local_datasource.dart';
import 'package:architech_todo/src/app/features/home/data/repositories/home_repo_impl.dart';
import 'package:architech_todo/src/app/features/home/domain/repositories/home_repo.dart';
import 'package:architech_todo/src/app/features/home/domain/usecases/home_usecase.dart';
import 'package:architech_todo/src/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:architech_todo/src/app/features/splash/data/datasources/local_data_source.dart';
import 'package:architech_todo/src/app/features/splash/data/repositories/splash_repo_impl.dart';
import 'package:architech_todo/src/app/features/splash/domain/repositories/splash_repo.dart';
import 'package:architech_todo/src/app/features/splash/domain/usecases/splash_usecase.dart';
import 'package:architech_todo/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:architech_todo/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:architech_todo/src/app/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:architech_todo/src/app/features/todo/data/repositories/todo_repo_impl.dart';
import 'package:architech_todo/src/app/features/todo/domain/repositories/todo_repo.dart';
import 'package:architech_todo/src/app/features/todo/domain/usecases/todo_usecase.dart';
import 'package:architech_todo/src/app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:architech_todo/src/core/helpers/database_helper.dart';
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
  sl.registerLazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(databaseHelper: sl(), sharedPreferences: sl()));

  //---------- for HOme -----------------------------------------------

  // Bloc
  sl.registerFactory(() => HomeBloc(homeUseCase: sl()));
  // usecase
  sl.registerLazySingleton(() => HomeUseCase(sl()));
  // Reposiroty
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(localDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<HomeLocalDataSource>(() =>
      HomeLocalDataSourceImpl(databaseHelper: sl(), sharedPreferences: sl()));

  //---------- for Todo -----------------------------------------------

  // Bloc
  sl.registerFactory(() => TodoBloc(todoUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => TodoUsecase(todoRepository: sl()));
  // Reposiroty
  sl.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(localDataSource: sl()));
  // DataSources
  sl.registerLazySingleton<TodoLocalDataSource>(() =>
      TodoLocalDataSourceImpl(databaseHelper: sl(), sharedPreferences: sl()));
  //---------- for core -----------------------------------------------
  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//---------------------------------------------------------------------------
  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  final databaseHelper = DatabaseHelper.instance;
  sl.registerLazySingleton(() => databaseHelper);

  // sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

//---------------------------------------------------------------------------
}
