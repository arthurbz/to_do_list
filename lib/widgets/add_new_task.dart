import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';

//Show a dialog that allows the user to create or edit a task.
//### MISSING FEATURES ###
// Proper Form Focus and keyboard actions.
// BottomModalSheet size is too big and doesn't work proper with keyboard.
// Keyboard must push the sheet up so the "ADD TASK" button is visible.

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
  TimeOfDay _selectedTime;
  DateTime _selectedDate;
  final _formKey = GlobalKey<FormState>();
  String _inputDescription;

  //This method looks dirty but I haven't found another approach
  //Basically it shows the DatePicker, then, if the user selected a date it'll show the TimePicker.
  //Otherwise it won't show the TimePicker.
  void _pickUserDueDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030))
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date; //Use intl package to format!
      });
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((time) {
        if (time == null) {
          return;
        }
        setState(() {
          _selectedTime = time;
        });
      });
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
                _inputDescription = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Due time', style: Theme.of(context).textTheme.title),
            TextField(
              onTap: () {
                _pickUserDueDate();
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: _selectedDate == null
                    ? 'Provide your due time'
                    : 'Working on it :P',
              ), //Update as user pick the time
            ),
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
                        .createNewTask(Task(
                      id: DateTime.now().toString(),
                      description: _inputDescription,
                      dueDate: _selectedDate,
                      dueTime: _selectedTime,
                    ));
                    Navigator.of(context).pop();
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
