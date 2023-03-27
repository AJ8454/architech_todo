part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;
  const TodoLoadedState({required this.todos});

  @override
  List<Object> get props => [todos];
}

class TodoTaskCreatedState extends TodoState {}

class TodoFailureState extends TodoState {
  final String error;
  const TodoFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
