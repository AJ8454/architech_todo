class TodoEntitie {
  final int? id;
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final DateTime createdAt;

  TodoEntitie({
    this.id,
    required this.title,
    required this.description,
    required this.fromDate,
    required this.toDate,
    required this.createdAt,
  });
}
