import 'package:example/model/input_data.dart';
import 'package:example/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/project_input_data.dart';

class ProjectTaskListInput extends StatefulWidget {
  const ProjectTaskListInput({Key key}) : super(key: key);

  @override
  State<ProjectTaskListInput> createState() => _ProjectTaskListInputState();
}

class _ProjectTaskListInputState extends State<ProjectTaskListInput> {
  final formKey = GlobalKey<FormState>();
  String lists = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const Divider(color: Colors.grey, thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 28, 18, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task List',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Task List can\'t be empty';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lists = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter the List of the Project',
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                Provider.of<ProjectInputData>(context, listen: false)
                    .addProjectList(lists);
                Navigator.of(context).pop();
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                child: Text(
                  'Add TaskList',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
