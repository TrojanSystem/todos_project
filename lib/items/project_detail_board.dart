import 'package:example/input_form/project_task_list_input.dart';
import 'package:example/items/project_detail_board_item.dart';
import 'package:example/model/project_todo_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailBoard extends StatefulWidget {
  final String indexOfClick;

  ProjectDetailBoard({this.indexOfClick});

  @override
  State<ProjectDetailBoard> createState() => _ProjectDetailBoardState();
}

class _ProjectDetailBoardState extends State<ProjectDetailBoard> {
  @override
  Widget build(BuildContext context) {

    final selectedTodo = Provider.of<ProjectTodoInputData>(context)
        .projectTodoLists
        .where((element) => element.indexs == widget.indexOfClick)
        .toList();


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
        title: const Text(
          'Board',
          style: TextStyle(
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
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ProjectDetailBoardItem(
                  selectedTodo: selectedTodo[index],
                  index: index,
                );
              },
              itemCount: selectedTodo.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => ProjectTaskListInput(
              index: widget.indexOfClick,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
