import 'package:example/input_form/update_task.dart';
import 'package:example/model/input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final int index;

  TaskListItem({this.task, this.index});



  @override
  Widget build(BuildContext context) {
    bool _isTapped = false;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => UpdateTask(
              index: index,
              existedDescription: task.description,
              existedTitle: task.title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left: 20, top: 10),
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(task.description),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                 Provider.of<InputData>(context, listen: false)
                      .changeStatus();
                },
                icon: Icon(
                  Provider.of<InputData>(context, listen: false)
                      .isTaped
                      ? Icons.circle_outlined
                      : Icons.check_circle_outline_rounded,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.red.withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }
}
