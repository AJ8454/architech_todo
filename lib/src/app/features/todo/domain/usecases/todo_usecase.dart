import 'package:architech_todo/src/app/features/todo/data/models/todo_model.dart';
import 'package:architech_todo/src/app/features/todo/domain/entities/todo_enitities.dart';
import 'package:architech_todo/src/app/features/todo/domain/repositories/todo_repo.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class TodoUsecase {
  final TodoRepository todoRepository;
  TodoUsecase({required this.todoRepository});

  Future<Either<Failure, Unit>> callCreateTask(TodoEntitie todo) async {
    return await todoRepository.createTask(todo);
  }

  Future<Either<Failure, List<TodoModel>>> callUpateTask(
      TodoEntitie todo) async {
    return await todoRepository.updateTask(todo);
  }

  Future<Either<Failure, List<TodoModel>>> callDeleteTask(int id) async {
    return await todoRepository.deleteTask(id);
  }

  Future<Either<Failure, List<TodoModel>>> callgetAllTask() async {
    return await todoRepository.getAllTasks();
  }
}
