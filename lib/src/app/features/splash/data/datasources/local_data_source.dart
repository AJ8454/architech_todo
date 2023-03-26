import 'dart:convert';

import 'package:architech_todo/src/app/features/authentication/data/models/user_model.dart';
import 'package:architech_todo/src/core/errors/exceptions.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashLocalDataSource {
  Future<bool> getCachedUserLogged();
  Future<void> setCachedUserLogged(bool isLog);
  Future<UserModel> getCachedUser();
}

const cacheUserLoggedKey = "CACHED_USERLOGGED";

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences sharedPreference;

  SplashLocalDataSourceImpl({required this.sharedPreference});

  @override
  Future<bool> getCachedUserLogged() async {
    final jsonBool = sharedPreference.getBool(cacheUserLoggedKey);
    if (jsonBool != null) {
      return (jsonBool);
    } else {
      return false;
    }
  }

  @override
  Future<void> setCachedUserLogged(bool isLog) async {
    await sharedPreference.setBool(cacheUserLoggedKey, isLog);
  }

  @override
  Future<UserModel> getCachedUser() async {
    final jsonString = sharedPreference.getString(AppStrings.cacheUserKey);
    if (jsonString != null) {
      UserModel userCacheModel = UserModel.fromJson(json.decode(jsonString));

      return Future.value(userCacheModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
