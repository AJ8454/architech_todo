import 'package:architech_todo/src/app/features/todo/data/models/todo_model.dart';
import 'package:architech_todo/src/app/features/todo/domain/usecases/todo_usecase.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:architech_todo/src/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUsecase todoUsecase;
  TodoBloc({required this.todoUsecase}) : super(TodoInitial()) {
    on<CreateTaskEvent>((event, emit) => _onCreateTaskEvent(event, emit));

    on<GetAllTodoEvent>((event, emit) => _onGetAllTodoEvent(event, emit));

    on<UpdateTaskEvent>((event, emit) => _onUpdateTaskEvent(event, emit));

    on<DeleteTaskEvent>((event, emit) => _onDeleteTaskEvent(event, emit));
  }

  void _onDeleteTaskEvent(
    DeleteTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    final successOrFail = await todoUsecase.callDeleteTask(event.id);
    emit(successOrFail.fold(
      (l) => TodoFailureState(error: _mapFailureToMessage(l)),
      (r) => TodoLoadedState(todos: r),
    ));
  }

  void _onUpdateTaskEvent(
    UpdateTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    final successOrFail = await todoUsecase.callUpateTask(event.todo);
    emit(successOrFail.fold(
      (l) => TodoFailureState(error: _mapFailureToMessage(l)),
      (r) => TodoLoadedState(todos: r),
    ));
  }

  void _onGetAllTodoEvent(
    GetAllTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoadingState());
    final successOrFail = await todoUsecase.callgetAllTask();
    emit(successOrFail.fold(
      (l) => TodoFailureState(error: _mapFailureToMessage(l)),
      (r) => TodoLoadedState(todos: r),
    ));
  }

  void _onCreateTaskEvent(
    CreateTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoadingState());
    final successOrFail = await todoUsecase.callCreateTask(event.todo);
    emit(successOrFail.fold(
      (l) => TodoFailureState(error: _mapFailureToMessage(l)),
      (r) => TodoTaskCreatedState(),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessage;
      case EmptyCacheFailure:
        return AppStrings.emptyCacheFailureMessage;
      case OfflineFailure:
        return AppStrings.offlineFailureMessage;
      default:
        return "Unexpected Error. Please try again later.";
    }
  }
}
