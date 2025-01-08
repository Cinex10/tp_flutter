import 'package:flutter/material.dart';
import 'package:tp_flutter/models/todo.dart';

class AnimatedTodoItem extends StatelessWidget {
  final Todo todo;
  final Function(String) onToggle;
  final Function(String) onDelete;
  final Animation<double> animation;

  const AnimatedTodoItem({
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.animation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (_) => onToggle(todo.id),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                decoration:
                    todo.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: todo.dueDate != null
                ? Text(
                    'Due: ${_formatDate(todo.dueDate!)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : null,
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete(todo.id),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
