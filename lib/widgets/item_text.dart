import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  final bool check;
  final String text;
  final String dueDate;
  final String dueTime;

  //Just shows the text inside a ListItem.
  //### MISSING FEATURES ###
  //Treat text overflow.
  //Show due date and due time if they exist.

  ItemText(
    this.check,
    this.text,
    this.dueDate,
    this.dueTime,
  );

  Widget _buildText() {
    if (check) {
      return Text(
        text,
        overflow: TextOverflow.fade,
        style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough),
      );
    }
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: TextStyle(
        fontSize: 22,
      ),
    );
  }

  Widget _buildDateText() {}

  @override
  Widget build(BuildContext context) {
    return _buildText(); //Search if it's ok to return something like this :P
  }
}
