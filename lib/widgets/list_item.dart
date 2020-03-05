import 'package:flutter/material.dart';

import '../providers/task.dart';

//A widget that composes every single item in the list.
//### MISSING FEATURES ###
// 1. Allows the user to check it as done.
// 2. Dismiss a task (Delete).
// 3. Edit a task through the icon button.

class ListItem extends StatefulWidget {
  final Task task;

  ListItem(this.task);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: null,
      ),
      title: Text(widget.task.description),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: null,
      ),
    );
  }
}
