import 'package:flutter/material.dart';

class ProjectTitleModel {
  int id;
  String title;

  ProjectTitleModel({this.title, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  static ProjectTitleModel fromMap(Map<String, dynamic> map) {
    return ProjectTitleModel(
      id: map['id'],
      title: map['title'],
    );
  }
}
