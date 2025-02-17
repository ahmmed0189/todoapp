import 'package:flutter/material.dart';
import 'package:todoapp/src/features/data/database_repository.dart';

import 'package:todoapp/src/features/data/mock_database.dart';
import 'package:todoapp/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required DatabaseRepository databaseRepository});

  @override
  // ignore: library_private_types_in_public_api
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final MockDatabase _database = MockDatabase();
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _database.addTodo(Todo(title: _controller.text));
        _controller.clear();
      }
    });
  }

  void _removeTodoAt(int index) {
    setState(() {
      _database.removeTodo(_database.getTodos()[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Liste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: 'Neuen Todo hinzufügen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Hinzufügen'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _database.getTodos().length,
                itemBuilder: (context, index) {
                  final todo = _database.getTodos()[index];
                  return ListTile(
                    title: Text(todo.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeTodoAt(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
