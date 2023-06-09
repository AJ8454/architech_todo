import 'package:architech_todo/src/app/architech_todo_app.dart';
import 'package:architech_todo/src/core/helpers/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architech_todo/src/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();

  runApp(const ArchitechToDoApp());
}
