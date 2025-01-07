class Todo {
  final String id;
  final String title;
  bool isCompleted;
  final DateTime createdAt;

  Todo({
    required this.title,
    this.isCompleted = false,
  })  : id = DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt = DateTime.now();

  void toggleComplete() {
    isCompleted = !isCompleted;
  }
}
