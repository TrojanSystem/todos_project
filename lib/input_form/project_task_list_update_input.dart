import 'package:example/model/project_list_model.dart';
import 'package:example/model/project_todo_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectTaskListUpdateInput extends StatefulWidget {
  final int index;
  final String taskList;
  final String strrIndex;

  ProjectTaskListUpdateInput({this.index, this.taskList, this.strrIndex});

  @override
  State<ProjectTaskListUpdateInput> createState() =>
      _ProjectTaskListUpdateInputState();
}

class _ProjectTaskListUpdateInputState
    extends State<ProjectTaskListUpdateInput> {
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
                TextFormField(maxLines: 2,
                  initialValue: widget.taskList,
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
                    hintText: 'Update the List of the Project',
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
                var projectTodoModel = ProjectListModel(
                  todo: lists,
                  indexs: widget.strrIndex,
                  id: widget.index,
                );
                Provider.of<ProjectTodoInputData>(context, listen: false)
                    .updateProjectTitleList(projectTodoModel);
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
                  'Update TaskList',
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
