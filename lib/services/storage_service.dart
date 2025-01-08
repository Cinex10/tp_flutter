import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

class StorageService {
  static const String _todosKey = 'todos';
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<List<Todo>> loadTodos() async {
    final String? todosJson = _prefs.getString(_todosKey);
    if (todosJson == null) return [];

    final List<dynamic> decoded = jsonDecode(todosJson);
    return decoded.map((json) => Todo.fromJson(json)).toList();
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final String encoded = jsonEncode(
      todos.map((todo) => todo.toJson()).toList(),
    );
    await _prefs.setString(_todosKey, encoded);
  }
}
