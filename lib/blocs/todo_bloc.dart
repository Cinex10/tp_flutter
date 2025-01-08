import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:tp_flutter/models/todo.dart';

class TodoBloc {
  final _todosController = BehaviorSubject<List<Todo>>.seeded([]);
  final _filterController = BehaviorSubject<String>.seeded('all');

  Stream<List<Todo>> get todos => _todosController.stream;
  Stream<String> get filter => _filterController.stream;

  Stream<List<Todo>> get filteredTodos => Rx.combineLatest2(
        todos,
        filter,
        (List<Todo> todos, String filter) {
          switch (filter) {
            case 'active':
              return todos.where((todo) => !todo.isCompleted).toList();
            case 'completed':
              return todos.where((todo) => todo.isCompleted).toList();
            default:
              return todos;
          }
        },
      );

  void addTodo(Todo todo) {
    final currentTodos = _todosController.value;
    _todosController.add([...currentTodos, todo]);
  }

  void toggleTodo(String id) {
    final currentTodos = _todosController.value;
    final index = currentTodos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      currentTodos[index].isCompleted = !currentTodos[index].isCompleted;
      _todosController.add(List.from(currentTodos));
    }
  }

  void deleteTodo(String id) {
    final currentTodos = _todosController.value;
    _todosController.add(
      currentTodos.where((todo) => todo.id != id).toList(),
    );
  }

  void updateFilter(String newFilter) {
    _filterController.add(newFilter);
  }

  void dispose() {
    _todosController.close();
    _filterController.close();
  }
}
