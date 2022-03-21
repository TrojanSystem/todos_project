import 'package:example/database/database_creator.dart';
import 'package:flutter/material.dart';

import 'task_model.dart';

class InputData extends ChangeNotifier {
  DatabaseHelper db = DatabaseHelper();
  int taskDone = 0;
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

  Future changeStatusForTask(Task task) async {
    task.isCompeleted = !task.isCompeleted;

    await db.updateTaskList(task);
    _taskList = await db.getTasks();
    notifyListeners();
  }

  String percent() {
    double x = 0;
    if (taskLists.isEmpty) {
      x = (taskDone / 1);
    } else {
      x = (taskDone / taskLists.length);
    }

    if (x < 1) {
      return x.toStringAsFixed(2);
    } else {
      return 1.0.toString();
    }
  }

  int doublePercent() {
    double x = 0;
    if (taskLists.isEmpty) {
      x = (taskDone * 100 / 1);
    } else {
      x = (taskDone * 100 / taskLists.length);
    }

    return x.floor();
  }

  List daysOfMonth = [
    {
      'mon': 'Day 1',
      'day': 1,
    },
    {
      'mon': 'Day 2',
      'day': 2,
    },
    {
      'mon': 'Day 3',
      'day': 3,
    },
    {
      'mon': 'Day 4',
      'day': 4,
    },
    {
      'mon': 'Day 5',
      'day': 5,
    },
    {
      'mon': 'Day 6',
      'day': 6,
    },
    {
      'mon': 'Day 7',
      'day': 7,
    },
    {
      'mon': 'Day 8',
      'day': 8,
    },
    {
      'mon': 'Day 9',
      'day': 9,
    },
    {
      'mon': 'Day 10',
      'day': 10,
    },
    {
      'mon': 'Day 11',
      'day': 11,
    },
    {
      'mon': 'Day 12',
      'day': 12,
    },
    {
      'mon': 'Day 13',
      'day': 13,
    },
    {
      'mon': 'Day 14',
      'day': 14,
    },
    {
      'mon': 'Day 15',
      'day': 15,
    },
    {
      'mon': 'Day 16',
      'day': 16,
    },
    {
      'mon': 'Day 17',
      'day': 17,
    },
    {
      'mon': 'Day 18',
      'day': 18,
    },
    {
      'mon': 'Day 19',
      'day': 19,
    },
    {
      'mon': 'Day 20',
      'day': 20,
    },
    {
      'mon': 'Day 21',
      'day': 21,
    },
    {
      'mon': 'Day 22',
      'day': 22,
    },
    {
      'mon': 'Day 23',
      'day': 23,
    },
    {
      'mon': 'Day 24',
      'day': 24,
    },
    {
      'mon': 'Day 25',
      'day': 25,
    },
    {
      'mon': 'Day 26',
      'day': 26,
    },
    {
      'mon': 'Day 27',
      'day': 27,
    },
    {
      'mon': 'Day 28',
      'day': 28,
    },
    {
      'mon': 'Day 29',
      'day': 29,
    },
    {
      'mon': 'Day 30',
      'day': 30,
    },
    {
      'mon': 'Day 31',
      'day': 31,
    },
  ];

}
