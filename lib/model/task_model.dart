import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  DateTime dateTime;
  TimeOfDay alarm;

  Task({this.dateTime, this.description, this.title, this.alarm});
}
