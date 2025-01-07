import 'package:flutter/material.dart';

class AddTodoForm extends StatefulWidget {
  final Function(String) onSubmit;

  const AddTodoForm({super.key, required this.onSubmit});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _controller = TextEditingController();

  void _submitForm() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSubmit(text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Ajouter une tâche',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _submitForm(),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
