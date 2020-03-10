import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';

//Show a dialog that allows the user to create or edit a task.

class AddNewTask extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Task newTask = Task(
    id: DateTime.now().toString(),
    description: '',
  );

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
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              onSaved: (value) {
                newTask.description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Due time'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Provide your due time',
              ), //Update as user pick the time
            ),
            //Show time picker
            FlatButton(
              child: Text('Add task'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  //Provider.of<TaskProvider>(context, listen: false).createNewTask(newTask);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
