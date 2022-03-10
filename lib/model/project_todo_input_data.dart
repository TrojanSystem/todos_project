import 'package:example/database/database_project_list.dart';
import 'package:example/database/database_project_title.dart';
import 'package:example/model/project_list_model.dart';
import 'package:example/model/project_title_model.dart';
import 'package:flutter/material.dart';

class ProjectTodoInputData extends ChangeNotifier {
  DatabaseProjectList db = DatabaseProjectList();
  int taskDone = 2;
  bool _isLoading = true;
  bool _isTaped = true;
  List<ProjectListModel> _projectTodoList = [];

  List<ProjectListModel> get projectTodoLists => _projectTodoList;

  bool get isLoading => _isLoading;

  bool get isTaped => _isTaped;

  bool changeStatus() {
    _isTaped = !_isTaped;
    return _isTaped;
  }

  Future loadProjectTodoList() async {
    _isLoading = true;
    notifyListeners();
    _projectTodoList = await db.getTasks();
    _isLoading = false;
    notifyListeners();
  }

  Future addProjectTitleList(ProjectListModel task) async {
    await db.insertTask(task);
    await loadProjectTodoList();
    notifyListeners();
  }

  Future updateProjectTitleList(ProjectListModel task) async {
    await db.updateTaskList(task);
    await loadProjectTodoList();
    notifyListeners();
  }

  Future deleteProjectTitleList(int task) async {
    await db.deleteTask(task);
    await loadProjectTodoList();
    notifyListeners();
  }

  String percent() {
    double x = (taskDone / _projectTodoList.length);
    return 0.8.toStringAsFixed(2);
  }

  int doublePercent() {
    double x = (taskDone * 100 / _projectTodoList.length);
    return 8.floor();
  }
}
