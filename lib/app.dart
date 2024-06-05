import 'package:flutter/material.dart';
import 'package:todoapp/src/features/data/database_repository.dart';
import 'package:todoapp/src/features/data/mock_database.dart';
import 'package:todoapp/todo_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();
    return MaterialApp(
      home: TodoScreen(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
