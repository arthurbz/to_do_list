import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';

//Show a dialog that allows the user to create or edit a task.

class AddNewTask extends StatefulWidget {
  static void addNewTaskSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewTask();
        });
  }

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  Future<TimeOfDay> _selectedTime;
  Future<DateTime> _selectedDate;
  final _formKey = GlobalKey<FormState>();
  Task _newTask = Task(
    id: DateTime.now().toString(),
    description: '',
  );

  // void _pickUserDueTime() {
  //   setState(() {
  //     _selectedDate = showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime(2030),//Is it ok to leave it like this?
  //     );
  //     _selectedTime = showTimePicker(
  //       initialTime: TimeOfDay.now(),
  //       context: context,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Title', style: Theme.of(context).textTheme.title),
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
                _newTask.description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            // Text('Due time', style: Theme.of(context).textTheme.title),
            // TextField(
            //   onTap: () {
            //     //_pickUserDueTime();
            //   },
            //   decoration: InputDecoration(
            //     hintText: _selectedTime == null
            //         ? 'Provide your due time'
            //         : _selectedTime
            //             .toString(), //Fix this so I can assign it to the object dueTime :P
            //   ), //Update as user pick the time
            // ),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text(
                  'ADD TASK',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Provider.of<TaskProvider>(context, listen: false)
                        .createNewTask(_newTask);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
