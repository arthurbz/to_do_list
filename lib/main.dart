import 'package:flutter/material.dart';

import './widgets/task_list.dart';

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TO DO LIST'),
        ),
        body: TaskList(),
      ),
    );
  }
}
