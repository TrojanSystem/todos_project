import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  String description;
  DateTime dateTime;
  TimeOfDay alarm;

  Task({this.dateTime, this.description, this.title, this.alarm, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
