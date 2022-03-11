import 'package:example/database/database_project_list.dart';
import 'package:example/model/project_list_model.dart';
import 'package:flutter/material.dart';

class ProjectTodoInputData extends ChangeNotifier {
  DatabaseProjectList db = DatabaseProjectList();
  int projectTaskDone = 0;
  int projectTaskLength = 0;
  bool _isLoading = true;
  bool _isTaped = true;
  int clickedTotLength = 0;
  int clickedCompletedLength = 0;
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

  Future changeStatusForTaskList(ProjectListModel model) async {
    model.isTaskCompleted = !model.isTaskCompleted;
    await db.updateTaskList(model);
    notifyListeners();
    _projectTodoList = await db.getTasks();
    notifyListeners();
  }


  String percent(String index) {
    double x = 0;
    var xx =
        _projectTodoList.where((element) => element.indexs == index).toList();
    clickedTotLength = xx.length;

    var yy = xx.where((element) => element.isTaskCompleted == true).toList();
    clickedCompletedLength = yy.length;

    if (clickedTotLength == 0) {
      (clickedCompletedLength / 1);
    } else {
      x = (clickedCompletedLength / clickedTotLength);
    }

    if (x < 1) {
      return x.toStringAsFixed(2);
    } else {
      return 1.0.toString();
    }
  }

  int doublePercent(String index) {
    double x = 0;
    var xx =
        _projectTodoList.where((element) => element.indexs == index).toList();
    clickedTotLength = xx.length;

    var yy = xx.where((element) => element.isTaskCompleted == true).toList();
    clickedCompletedLength = yy.length;

    if (clickedTotLength == 0) {
      (clickedCompletedLength * 100 / 1);
    } else {
      x = (clickedCompletedLength * 100 / clickedTotLength);
    }
    return x.floor();
  }
}
