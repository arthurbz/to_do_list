import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';

//A widget that composes every single item in the list.
//Allows the user to check it as done.
//Deletes a task when dismissed.
//### MISSING FEATURES ###
// Edit a task through the icon button.

class ListItem extends StatefulWidget {
  final Task task;

  ListItem(this.task);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Widget _buildText(bool check, String text) {
    if (check) {
      return Text(
        text,
        style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough),
      );
    }
    return Text(text,
        style: TextStyle(
          fontSize: 22,
        ));
  }

  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Provider.of<TaskProvider>(context, listen: false)
            .changeStatus(widget.task.id);
        //print('SET STATE ${widget.task.isDone.toString()}');
      });
    }

    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<TaskProvider>(context, listen: false)
            .removeTask(widget.task.id);
      },
      //Work on a background when dismissed.
      child: GestureDetector(
        onTap: _checkItem,
        child: Container(
          height: 65,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: widget.task.isDone,
                      onChanged: (_) => _checkItem(),
                    ),
                    _buildText(widget.task.isDone, widget.task.description),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
