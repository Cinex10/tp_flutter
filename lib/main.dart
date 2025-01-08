import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_flutter/app.dart';
import 'blocs/todo_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final storageService = StorageService(prefs);
  final themeBloc = ThemeBloc(prefs);

  runApp(
    MultiProvider(
      providers: [
        Provider<StorageService>(
          create: (_) => storageService,
        ),
        Provider<ThemeBloc>(
          create: (_) => themeBloc,
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<TodoBloc>(
          create: (context) => TodoBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: const TodoApp(),
    ),
  );
}
