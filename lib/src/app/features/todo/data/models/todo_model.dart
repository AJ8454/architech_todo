import 'package:architech_todo/src/app/features/todo/domain/entities/todo_enitities.dart';

class TodoDBFields {
  static final List<String> values = [id, title, description, fromDate, toDate];

  static const String id = "_id";
  static const String title = "title";
  static const String description = "description";
  static const String fromDate = "fromDate";
  static const String toDate = "toDate";
  static const String createdAt = "createAt";
}

class TodoModel extends TodoEntitie {
  TodoModel({
    super.id,
    required super.title,
    required super.description,
    required super.fromDate,
    required super.toDate,
    required super.createdAt,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? fromDate,
    DateTime? toDate,
    DateTime? createdAt,
  }) =>
      TodoModel(
        title: title ?? this.title,
        description: description ?? this.description,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        createdAt: createdAt ?? this.createdAt,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json[TodoDBFields.id],
        title: json[TodoDBFields.title],
        description: json[TodoDBFields.description],
        fromDate: DateTime.parse(json[TodoDBFields.fromDate]),
        toDate: DateTime.parse(json[TodoDBFields.toDate]),
        createdAt: DateTime.parse(json[TodoDBFields.createdAt]),
      );

  Map<String, dynamic> toJson() => {
        TodoDBFields.id: id,
        TodoDBFields.title: title,
        TodoDBFields.description: description,
        TodoDBFields.fromDate: fromDate.toIso8601String(),
        TodoDBFields.toDate: toDate.toIso8601String(),
        TodoDBFields.createdAt: createdAt.toIso8601String(),
      };
}
