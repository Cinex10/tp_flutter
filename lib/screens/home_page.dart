import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_list.dart';
import '../widgets/add_todo_form.dart';
import '../widgets/filter_buttons.dart';
import '../widgets/task_counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> _todos = [];
  String _currentFilter = 'all';

  void _addTodo(String title) {
    setState(() {
      _todos.add(Todo(title: title));
    });
  }

  void _toggleTodo(String id) {
    setState(() {
      final todo = _todos.firstWhere((todo) => todo.id == id);
      todo.toggleComplete();
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _changeFilter(String filter) {
    setState(() {
      _currentFilter = filter;
    });
  }

  List<Todo> get _filteredTodos {
    switch (_currentFilter) {
      case 'active':
        return _todos.where((todo) => !todo.isCompleted).toList();
      case 'completed':
        return _todos.where((todo) => todo.isCompleted).toList();
      default:
        return _todos;
    }
  }

  @override
  Widget build(BuildContext context) {
    final completedTasks = _todos.where((todo) => todo.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          AddTodoForm(onSubmit: _addTodo),
          FilterButtons(
            currentFilter: _currentFilter,
            onFilterChange: _changeFilter,
          ),
          TaskCounter(
            totalTasks: _todos.length,
            completedTasks: completedTasks,
          ),
          Expanded(
            child: TodoList(
              todos: _filteredTodos,
              onToggle: _toggleTodo,
              onDelete: _deleteTodo,
            ),
          ),
        ],
      ),
    );
  }
}
