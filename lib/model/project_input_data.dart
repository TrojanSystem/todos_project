import 'package:flutter/material.dart';

class ProjectInputData extends ChangeNotifier {
  List project = ['abs', 'cdg'];
  List projectTitle = ['Developing App', 'Studying Python'];

  void addProjectList(String data) {
    project.add(data);
    notifyListeners();
  }

  void addProjectTitle(String data) {
    projectTitle.add(data);
    notifyListeners();
  }
}
