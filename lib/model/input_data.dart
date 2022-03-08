import 'package:flutter/material.dart';

import 'task_model.dart';

class InputData extends ChangeNotifier {
  int taskDone = 2;
  final List<Task> _taskList = [
    Task(
      alarm: TimeOfDay.now(),
      dateTime: DateTime.now(),
      description: 'Talk about material needed for the next four',
      title: 'Call to Mele',
    ),
    Task(
      alarm: TimeOfDay.now(),
      dateTime: DateTime.now(),
      description: 'You need to open it for the next 30 day to gain the badge',
      title: 'Check Your StackOverflow',
    ),
    Task(
      alarm: TimeOfDay.now(),
      dateTime: DateTime.now(),
      description: 'It is just a daily check up',
      title: 'Call to Granny',
    ),
  ];

  List<Task> get taskLists => _taskList;

  addTaskList(Task task) {
    taskLists.insert(0, task);
    notifyListeners();
  }

  String percent() {
    double x = (taskDone / taskLists.length);
    return x.toStringAsFixed(1);
  }
  int doublePercent() {
    double x = (taskDone * 100 / taskLists.length);
    return x.floor();
  }
}
