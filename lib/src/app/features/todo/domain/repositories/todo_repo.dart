import 'package:architech_todo/src/app/features/todo/data/models/todo_model.dart';
import 'package:architech_todo/src/app/features/todo/domain/entities/todo_enitities.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, Unit>> createTask(TodoEntitie todo);
  Future<Either<Failure, List<TodoModel>>> updateTask(TodoEntitie todo);
  Future<Either<Failure, List<TodoModel>>> deleteTask(int id);
  Future<Either<Failure, List<TodoModel>>> getAllTasks();
}
