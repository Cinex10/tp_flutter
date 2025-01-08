class Todo {
  final String id;
  final String title;
  bool isCompleted;
  final DateTime createdAt;
  final DateTime? dueDate;
  final String? category;
  final int? priority;

  Todo({
    required this.title,
    this.isCompleted = false,
    this.dueDate,
    this.category,
    this.priority,
  })  : id = DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt = DateTime.now();

  Todo copyWith({
    String? title,
    bool? isCompleted,
    DateTime? dueDate,
    String? category,
    int? priority,
  }) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'category': category,
      'priority': priority,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      isCompleted: json['isCompleted'],
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      category: json['category'],
      priority: json['priority'],
    );
  }
}
