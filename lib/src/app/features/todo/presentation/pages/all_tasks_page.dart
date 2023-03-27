import 'package:architech_todo/src/app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:architech_todo/src/app/features/todo/presentation/pages/edit_task.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTaskPage extends StatefulWidget {
  const AllTaskPage({super.key});
  static const route = "/AllTasks";

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).add(GetAllTodoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Tasks"),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoadedState) {
            return state.todos.isEmpty
                ? Center(
                    child: Text(
                      "No Tasks yet....",
                      style: AppResponsive.responsiveTextStyle(context),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return Card(
                        child: ListTile(
                          title: Text(todo.title),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    AppNavigator.pushWithData(
                                        context,
                                        EditTasksPage.route,
                                        {"fromEdit": true, "todo": todo});
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.redAccent.shade100,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<TodoBloc>(context)
                                        .add(DeleteTaskEvent(todo.id!));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent.shade100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: state.todos.length,
                  );
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
