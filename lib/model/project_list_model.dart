import 'package:flutter/material.dart';

class ProjectListModel {
  int id;
  String indexs;
  String todo;
  bool isTaskCompleted;

  ProjectListModel({
    this.id,
    this.todo,
    this.indexs,
    this.isTaskCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'indexs': indexs,
      'todo': todo,
      'isTaskCompleted': isTaskCompleted ? 1 : 0,
    };
  }

  static ProjectListModel fromMap(Map<String, dynamic> map) {
    return ProjectListModel(
      id:map['id'],
      indexs: map['indexs'],
      todo: map['todo'],
      isTaskCompleted: map['isTaskCompleted'] == 1 ? true : false,
    );
  }
}
