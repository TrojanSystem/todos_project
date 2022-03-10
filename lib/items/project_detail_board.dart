import 'package:example/input_form/project_task_list_input.dart';
import 'package:example/model/project_list_model.dart';
import 'package:example/model/project_todo_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project_title_input_data.dart';

class ProjectDetailBoard extends StatefulWidget {
  final String index;

  ProjectDetailBoard({this.index});

  @override
  State<ProjectDetailBoard> createState() => _ProjectDetailBoardState();
}

class _ProjectDetailBoardState extends State<ProjectDetailBoard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    // final selectedTodo = Provider.of<ProjectTodoInputData>(context).projectTodoLists
    //     .firstWhere((meal) => meal.indexs == widget.index);
    // print('list $selectedTodo');
    final selectedTodo = Provider.of<ProjectTodoInputData>(context)
        .projectTodoLists
        .where((element) => element.indexs == widget.index)
        .toList();
    print(selectedTodo);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Text(
          'Board With index ${widget.index}',
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.grey, thickness: 1),
          Expanded(
            child: Consumer<ProjectTodoInputData>(
              builder: (context, data, child) {
                return ListView(
                  children: selectedTodo
                      .map(
                        (e) => Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.todo,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  decoration: _isChecked
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => ProjectTaskListInput(
              index: widget.index.toString(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
