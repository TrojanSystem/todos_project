import 'package:example/database/database_creator.dart';
import 'package:flutter/material.dart';

import 'task_model.dart';

class InputData extends ChangeNotifier {
  DatabaseHelper db = DatabaseHelper();
  int taskDone = 2;
  bool _isLoading = true;
  bool _isTaped = true;
  List<Task> _taskList = [];

  List<Task> get taskLists => _taskList;

  bool get isLoading => _isLoading;

  bool get isTaped => _isTaped;

  bool changeStatus() {
    _isTaped = !_isTaped;
    return _isTaped;
  }

  Future loadTaskList() async {
    _isLoading = true;
    notifyListeners();
    _taskList = await db.getTasks();
    _isLoading = false;
    notifyListeners();
  }

  Future addTaskList(Task task) async {
    await db.insertTask(task);
    await loadTaskList();
    notifyListeners();
  }

  Future updateTaskList(Task task) async {
    await db.updateTaskList(task);
    await loadTaskList();
    notifyListeners();
  }

  Future deleteTaskList(int task) async {
    await db.deleteTask(task);
    await loadTaskList();
    notifyListeners();
  }

  String percent() {
    double x = (taskDone / taskLists.length);
    return 0.8.toStringAsFixed(2);
  }

  int doublePercent() {
    double x = (taskDone * 100 / taskLists.length);
    return 8.floor();
  }
}
