import 'package:flutter/material.dart';

class ProjectListModel {
  String indexs;
  String todo;

  ProjectListModel({this.todo, this.indexs});

  Map<String, dynamic> toMap() {
    return {
      'indexs': indexs,
      'todo': todo,
    };
  }

  static ProjectListModel fromMap(Map<String, dynamic> map) {
    return ProjectListModel(
      indexs: map['indexs'],
      todo: map['todo'],
    );
  }
}
