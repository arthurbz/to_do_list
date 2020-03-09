import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  Widget _buildText(bool check, String text) {
    if(check){
      return Text(text, style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),);
    } 
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  onChanged: (_) {
                    setState(() {
                      Provider.of<TaskProvider>(context, listen: false)
                          .changeStatus(widget.task.id);
                          //print('SET STATE ${widget.task.isDone.toString()}');
                    });
                  },
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
    );
  }
}
