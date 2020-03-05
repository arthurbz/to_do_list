import 'package:flutter/material.dart';

import './task_item.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: null, itemBuilder: (context, index) {
      return TaskItem();
    });
  }
}