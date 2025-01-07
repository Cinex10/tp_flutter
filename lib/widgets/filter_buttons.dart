import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final String currentFilter;
  final Function(String) onFilterChange;

  const FilterButtons({
    super.key,
    required this.currentFilter,
    required this.onFilterChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterChip(
          label: const Text('Toutes'),
          selected: currentFilter == 'all',
          onSelected: (_) => onFilterChange('all'),
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text('Actives'),
          selected: currentFilter == 'active',
          onSelected: (_) => onFilterChange('active'),
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text('Terminées'),
          selected: currentFilter == 'completed',
          onSelected: (_) => onFilterChange('completed'),
        ),
      ],
    );
  }
}
