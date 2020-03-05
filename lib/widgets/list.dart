import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import './list_item.dart';

//Parent widget of all ListItems, this widget role is just to group all list tiles.

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return ListItem(taskList[index]);
        });
  }
}
