import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';

//Show a dialog that allows the user to create or edit a task.

class AddNewTask extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  static void addNewTaskSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewTask();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text('Title'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Describe your task',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Text('Due time'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Provide your due time',
              ), //Update as user pick the time
            ),
            //Show time picker
          ],
        ),
      ),
    );
  }
}
