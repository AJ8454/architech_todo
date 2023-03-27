import 'package:architech_todo/src/app/features/todo/data/models/todo_model.dart';
import 'package:architech_todo/src/core/helpers/database_helper.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class TodoLocalDataSource {
  Future<void> createNewTask(TodoModel todo);
  Future<List<TodoModel>> updateTask(TodoModel todo);
  Future<List<TodoModel>> deleteTask(int id);
  Future<List<TodoModel>> getAllTasks();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;
  final DatabaseHelper databaseHelper;
  TodoLocalDataSourceImpl(
      {required this.databaseHelper, required this.sharedPreferences});

  @override
  Future<void> createNewTask(TodoModel todo) async {
    Database db = await databaseHelper.database;
    final id = await db.insert(AppStrings.todoTable, todo.toJson());
    print("todo id $id");
  }

  @override
  Future<List<TodoModel>> getAllTasks() async {
    Database db = await databaseHelper.database;
    const orderBy = '${TodoDBFields.createdAt} ASC';
    final result = await db.query(AppStrings.todoTable, orderBy: orderBy);
    return result.map((json) => TodoModel.fromJson(json)).toList();
  }

  @override
  Future<List<TodoModel>> deleteTask(int id) async {
    Database db = await databaseHelper.database;
    int res = await db.delete(
      AppStrings.todoTable,
      where: '${TodoDBFields.id} = ?',
      whereArgs: [id],
    );
    print(res);
    List<TodoModel> data = await getAllTasks();
    return data;
  }

  @override
  Future<List<TodoModel>> updateTask(TodoModel todo) async {
    Database db = await databaseHelper.database;
    int res = await db.update(
      AppStrings.todoTable,
      todo.toJson(),
      where: '${TodoDBFields.id} = ?',
      whereArgs: [todo.id],
    );
    print(res);
    List<TodoModel> data = await getAllTasks();
    return data;
  }
}
