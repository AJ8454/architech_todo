import 'package:architech_todo/src/app/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:architech_todo/src/app/features/todo/data/models/todo_model.dart';
import 'package:architech_todo/src/app/features/todo/domain/entities/todo_enitities.dart';
import 'package:architech_todo/src/app/features/todo/domain/repositories/todo_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:architech_todo/src/core/errors/failures.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> createTask(TodoEntitie todo) async {
    try {
      TodoModel todoModel = TodoModel(
        title: todo.title,
        description: todo.description,
        fromDate: todo.fromDate,
        toDate: todo.toDate,
        createdAt: todo.createdAt,
      );
      await localDataSource.createNewTask(todoModel);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getAllTasks() async {
    try {
      final result = await localDataSource.getAllTasks();
      return right(result);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> deleteTask(int id) async {
    try {
      final result = await localDataSource.deleteTask(id);
      return right(result);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> updateTask(TodoEntitie todo) async {
    try {
      TodoModel todoModel = TodoModel(
        id: todo.id,
        title: todo.title,
        description: todo.description,
        fromDate: todo.fromDate,
        toDate: todo.toDate,
        createdAt: todo.createdAt,
      );
      final result = await localDataSource.updateTask(todoModel);
      return right(result);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
