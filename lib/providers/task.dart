import 'package:flutter/foundation.dart';

class Task {
  final String id;
  String taskDescription;
  String endTime;
  bool isDone;

  Task({
    @required this.id,
    @required this.taskDescription,
    this.endTime,
    this.isDone = false,
  });
}
