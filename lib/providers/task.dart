import 'package:flutter/foundation.dart';

//Everything the user adds to the list is a task.
//Task provider is self explanatory and its job is being the provider for the project.

class Task {
  final String id;
  String description;
  String dueTime;
  bool isDone;

  Task({
    @required this.id,
    @required this.description,
    this.dueTime,
    this.isDone = false,
  });
}

class TaskProvider with ChangeNotifier {

  List<Task> get itemsList {
    return _toDoList;
  }

  final List<Task> _toDoList = [
    Task(
      id: 'task#1',
      description: 'Create my models',
      dueTime: DateTime.now().toString(),
    ),
    Task(
      id: 'task#2',
      description: 'Add provider',
      dueTime: DateTime.now().toString(),
    ),
  ];

  void createNewTask(Task task) {
    _toDoList.add(task);
    notifyListeners();
  }

  void editTask(Task task) {
    _toDoList.add(task);
    notifyListeners();
  }

  void removeTask(String id) {
    _toDoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void changeStatus(String id) {
    int index = _toDoList.indexWhere((task) => task.id == id);
    _toDoList[index].isDone = !_toDoList[index].isDone;
    //print('PROVIDER ${_toDoList[index].isDone.toString()}');
  }
}
