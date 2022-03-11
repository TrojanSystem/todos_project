import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project_list_model.dart';
import '../model/project_todo_input_data.dart';

class ProjectDetailBoardItem extends StatelessWidget {
  const ProjectDetailBoardItem(
      {Key key, @required this.selectedTodo, this.index})
      : super(key: key);

  final ProjectListModel selectedTodo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Provider.of<ProjectTodoInputData>(context, listen: false)
                .changeStatusForTaskList(selectedTodo);
          },
          icon: Icon(
            !selectedTodo.isTaskCompleted
                ? Icons.check_box_outline_blank_sharp
                : Icons.check_box_sharp,
          ),
          color: Colors.black,
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedTodo.todo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                decoration: selectedTodo.isTaskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          onLongPress: () {
            Provider.of<ProjectTodoInputData>(context, listen: false)
                .deleteProjectTitleList(index);
          },
        ),
      ],
    );
  }
}
