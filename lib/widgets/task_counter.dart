import 'package:flutter/material.dart';

class TaskCounter extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const TaskCounter({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$completedTasks sur $totalTasks tâches terminées',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
