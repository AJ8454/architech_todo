import 'package:architech_todo/src/app/features/global/custom_rounded_button.dart';
import 'package:architech_todo/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:architech_todo/src/app/features/global/snackbar_message.dart';
import 'package:architech_todo/src/app/features/todo/data/models/todo_model.dart';
import 'package:architech_todo/src/app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditTasksPage extends StatefulWidget {
  const EditTasksPage({super.key, required this.data});
  static const route = "/EditTasksPage";
  final Map<String, dynamic> data;
  @override
  State<EditTasksPage> createState() => _EditTasksPageState();
}

class _EditTasksPageState extends State<EditTasksPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedFromDate = DateTime.now();
  String fromDate = '', toDate = '';
  DateTime selectedToDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    if (widget.data["fromEdit"]) {
      titleController = TextEditingController(text: widget.data["todo"].title);
      descriptionController =
          TextEditingController(text: widget.data["todo"].description);
      selectedFromDate = widget.data["todo"].fromDate;
      selectedToDate = widget.data["todo"].toDate;
      fromDate = dateFromatter(widget.data["todo"].fromDate);
      toDate = dateFromatter(widget.data["todo"].toDate);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["fromEdit"] ? "Edit Task" : "New Task"),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(listener: (context, state) {
        if (state is TodoFailureState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.error, context: context);
        }
        if (state is TodoTaskCreatedState) {
          SnackBarMessage()
              .showSuccessSnackBar(message: "Task Created", context: context);
          AppNavigator.pop(context);
        }
        if (state is TodoLoadedState) {
          SnackBarMessage()
              .showSuccessSnackBar(message: "Task Updated", context: context);
          AppNavigator.pop(context);
        }
      }, builder: (context, state) {
        if (state is TodoLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(AppResponsive.kdefaultPadding),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: titleController,
                      labelText: "Title",
                      hintText: "Enter Title",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Title";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: descriptionController,
                      labelText: "Description",
                      hintText: "Enter Description",
                      maxLines: 5,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "From Date :",
                            style: AppResponsive.responsiveTextStyle(context),
                          ),
                        ),
                        CustomRoundedButtonWidget(
                          child:
                              Text(fromDate == "" ? "Select Date" : fromDate),
                          onClicked: () {
                            _selectDate(context, true);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "To Date :",
                            style: AppResponsive.responsiveTextStyle(context),
                          ),
                        ),
                        CustomRoundedButtonWidget(
                          child: Text(toDate == "" ? "Select Date" : toDate),
                          onClicked: () {
                            _selectDate(context, false);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: CustomRoundedButtonWidget(
                        child:
                            Text(widget.data["fromEdit"] ? "Update" : "Save"),
                        onClicked: () {
                          if (_formKey.currentState!.validate()) {
                            if (fromDate != "" && toDate != "") {
                              if (widget.data["fromEdit"]) {
                                TodoModel todo = TodoModel(
                                  id: widget.data["todo"].id,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  fromDate: selectedFromDate,
                                  toDate: selectedToDate,
                                  createdAt: DateTime.now(),
                                );

                                BlocProvider.of<TodoBloc>(context)
                                    .add(UpdateTaskEvent(todo));
                              } else {
                                TodoModel todo = TodoModel(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  fromDate: selectedFromDate,
                                  toDate: selectedToDate,
                                  createdAt: DateTime.now(),
                                );

                                BlocProvider.of<TodoBloc>(context)
                                    .add(CreateTaskEvent(todo));
                              }
                            } else {
                              SnackBarMessage().showErrorSnackBar(
                                  message: "Please Select Date",
                                  context: context);
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _selectDate(BuildContext context, bool from) async {
    final cDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: cDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != cDate) {
      String formattedDate = dateFromatter(picked);
      if (from) {
        fromDate = formattedDate;
        selectedFromDate = picked;
      } else {
        toDate = formattedDate;
        selectedToDate = picked;
      }
      setState(() {});
    }
  }

  String dateFromatter(DateTime pdate) {
    return DateFormat('dd-MM-yyyy').format(pdate);
  }
}
