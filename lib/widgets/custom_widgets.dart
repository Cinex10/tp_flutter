import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;

  const AnimatedProgressIndicator({
    required this.value,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: value),
      duration: AppConstants.mediumAnimation,
      curve: AppConstants.defaultCurve,
      builder: (context, double value, child) {
        return LinearProgressIndicator(
          value: value,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
        );
      },
    );
  }
}

class PriorityBadge extends StatelessWidget {
  final int priority;

  const PriorityBadge({required this.priority, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppConstants.priorityColors[priority]?.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      child: Text(
        'P$priority',
        style: TextStyle(
          color: AppConstants.priorityColors[priority],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String category;
  final VoidCallback? onTap;

  const CategoryChip({
    required this.category,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(category),
      onPressed: onTap,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      labelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class EmptyStateAnimation extends StatelessWidget {
  const EmptyStateAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: AppConstants.longAnimation,
      curve: AppConstants.bounceCurve,
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 64,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          const SizedBox(height: AppConstants.defaultSpacing),
          Text(
            'Aucune tâche pour le moment',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
