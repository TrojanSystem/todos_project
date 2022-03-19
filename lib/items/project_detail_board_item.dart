import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../input_form/project_task_list_update_input.dart';
import '../model/project_list_model.dart';
import '../model/project_todo_input_data.dart';

class ProjectDetailBoardItem extends StatelessWidget {
  String strIndex;
  final ProjectListModel selectedTodo;
  final int index;

  ProjectDetailBoardItem({this.strIndex, this.index, this.selectedTodo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
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
        ),
        Expanded(
          flex: 7,
          child: GestureDetector(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedTodo.todo,
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 3,
                        decorationColor: Colors.red,
                        decoration: selectedTodo.isTaskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => ProjectTaskListUpdateInput(
                  taskList: selectedTodo.todo,
                  index: selectedTodo.id,
                  strrIndex: strIndex,
                ),
              );
            },
            onLongPress: () {
              Provider.of<ProjectTodoInputData>(context, listen: false)
                  .deleteProjectTitleList(selectedTodo.id);
            },
          ),
        ),
      ],
    );
  }
}
