import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_flutter/blocs/theme_bloc.dart';
import 'package:tp_flutter/blocs/todo_bloc.dart';
import 'package:tp_flutter/models/todo.dart';
import 'package:tp_flutter/widgets/add_todo_bottom_sheet.dart';
import 'package:tp_flutter/widgets/animated_todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showAddTodoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Builder(builder: (_) {
          return AddTodoBottomSheet(
            onSubmit: (todo) {
              context.read<TodoBloc>().addTodo(todo);
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          actions: [
            StreamBuilder<bool>(
              stream: context.read<ThemeBloc>().isDarkMode,
              builder: (context, snapshot) {
                final isDarkMode = snapshot.data ?? false;
                return IconButton(
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () => context.read<ThemeBloc>().toggleTheme(),
                  tooltip: isDarkMode
                      ? 'Passer au thème clair'
                      : 'Passer au thème sombre',
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            StreamBuilder<String>(
              stream: todoBloc.filter,
              builder: (context, snapshot) {
                final currentFilter = snapshot.data ?? 'all';
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterChip(
                      label: const Text('Toutes'),
                      selected: currentFilter == 'all',
                      onSelected: (_) => todoBloc.updateFilter('all'),
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      label: const Text('Actives'),
                      selected: currentFilter == 'active',
                      onSelected: (_) => todoBloc.updateFilter('active'),
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      label: const Text('Terminées'),
                      selected: currentFilter == 'completed',
                      onSelected: (_) => todoBloc.updateFilter('completed'),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: StreamBuilder<List<Todo>>(
                stream: todoBloc.filteredTodos,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final todos = snapshot.data!;

                  if (todos.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.list_alt,
                              size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'Aucune tâche',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    );
                  }

                  return AnimatedList(
                    initialItemCount: todos.length,
                    itemBuilder: (context, index, animation) {
                      return AnimatedTodoItem(
                        todo: todos[index],
                        animation: animation,
                        onToggle: (id) => todoBloc.toggleTodo(id),
                        onDelete: (id) => todoBloc.deleteTodo(id),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTodoBottomSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
