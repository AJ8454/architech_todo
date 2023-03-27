part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodoEvent extends TodoEvent {}

class CreateTaskEvent extends TodoEvent {
  final TodoModel todo;
  const CreateTaskEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTaskEvent extends TodoEvent {
  final TodoModel todo;
  const UpdateTaskEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class DeleteTaskEvent extends TodoEvent {
  final int id;
  const DeleteTaskEvent(this.id);
  @override
  List<Object> get props => [id];
}
