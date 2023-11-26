import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: darkModeTheme,
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}


