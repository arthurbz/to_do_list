import 'package:flutter/material.dart';

import '../widgets/add_new_task.dart';
import '../widgets/list.dart';

//Homepage of the app. It allows the user to insert new tasks to his list.
//It'll allow the user to add new lists too (later features).

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO LIST'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => AddNewTask(isEditMode: false),
              );
            },
          ),
        ],
      ),
      body: List(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTask(isEditMode: false),
          );
        },
        tooltip: 'Add a new item!',
      ),
    );
  }
}
