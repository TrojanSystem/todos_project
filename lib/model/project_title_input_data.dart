import 'package:example/database/database_project_title.dart';
import 'package:example/model/project_title_model.dart';
import 'package:flutter/material.dart';

class ProjectTitleInputData extends ChangeNotifier {
  DatabaseProjectTitle db = DatabaseProjectTitle();
  int taskDone = 2;
  bool _isLoading = true;
  bool _isTaped = true;
  List<ProjectTitleModel> _projectTitleList = [];

  List<ProjectTitleModel> get projectTitleLists => _projectTitleList;

  bool get isLoading => _isLoading;

  bool get isTaped => _isTaped;

  bool changeStatus() {
    _isTaped = !_isTaped;
    return _isTaped;
  }

  Future loadProjectTitleList() async {
    _isLoading = true;
    notifyListeners();
    _projectTitleList = await db.getTasks();
    _isLoading = false;
    notifyListeners();
  }

  Future addProjectTitleList(ProjectTitleModel task) async {
    await db.insertTask(task);
    await loadProjectTitleList();
    notifyListeners();
  }

  Future updateProjectTitleList(ProjectTitleModel task) async {
    await db.updateTaskList(task);
    await loadProjectTitleList();
    notifyListeners();
  }

  Future deleteProjectTitleList(int task) async {
    await db.deleteTask(task);
    await loadProjectTitleList();
    notifyListeners();
  }

  String percent() {
    double x = (taskDone / _projectTitleList.length);
    return 0.8.toStringAsFixed(2);
  }

  int doublePercent() {
    double x = (taskDone * 100 / _projectTitleList.length);
    return 8.floor();
  }
}
