import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  String description;
  String dateTime;
  TimeOfDay alarm;
  bool isCompeleted;

  Task(
      {this.dateTime,
      this.description,
      this.title,
      this.alarm,
      this.id,
      this.isCompeleted = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'isCompeleted': isCompeleted ? 1 : 0,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dateTime: map['dateTime'],
      isCompeleted: map['isCompeleted'] == 1 ? true : false,
    );
  }
}
