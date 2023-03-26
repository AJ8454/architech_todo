import 'package:architech_todo/src/app/features/authentication/data/models/user_model.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> createUser(UserModel user);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl();
  static final AuthLocalDataSourceImpl instance =
      AuthLocalDataSourceImpl._init();

  static Database? _database;

  AuthLocalDataSourceImpl._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(AppStrings.authDataBase);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createUserDB);
  }

  Future _createUserDB(Database db, int version) async {
    await db.execute('''CREATE TABLE ${AppStrings.authTable} (
        ${AuthDBFields.id} ${AppStrings.idType},
        ${AuthDBFields.userName} ${AppStrings.textType},
        ${AuthDBFields.email} ${AppStrings.textType},
        ${AuthDBFields.password} ${AppStrings.textType},
        ${AuthDBFields.fName} ${AppStrings.textType},
        ${AuthDBFields.lName} ${AppStrings.textType},
        ${AuthDBFields.gender} ${AppStrings.textType},
        ${AuthDBFields.image} ${AppStrings.textType},
        ${AuthDBFields.createdAt} ${AppStrings.textType},
      )
      ''');
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final db = await instance.database;
    final id = await db.insert(AppStrings.authTable, user.toJson());
    return user.copyWith(id: id);
  }

  Future<UserModel> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      AppStrings.authTable,
      columns: AuthDBFields.values,
      where: '${AuthDBFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw ServerFailure();
    }
  }

  Future<List<UserModel>> readAllUsers() async {
    final db = await instance.database;
    const orderBy = '${AuthDBFields.createdAt} ASC';
    final result = await db.query(AppStrings.authTable, orderBy: orderBy);
    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<int> updateUser(UserModel user) async {
    final db = await instance.database;
    return db.update(
      AppStrings.authTable,
      user.toJson(),
      where: '${AuthDBFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete(
      AppStrings.authTable,
      where: '${AuthDBFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
