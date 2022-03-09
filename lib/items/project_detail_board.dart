import 'package:example/input_form/project_task_list_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project_input_data.dart';

class ProjectDetailBoard extends StatefulWidget {
  final int index;

  ProjectDetailBoard({this.index});

  @override
  State<ProjectDetailBoard> createState() => _ProjectDetailBoardState();
}

class _ProjectDetailBoardState extends State<ProjectDetailBoard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            child: Consumer<ProjectInputData>(
              builder: (context, data, child) => ListView.builder(
                itemCount: data.project.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                    ),
                    Text(
                      data.project[index],
                      style: TextStyle(
                        decoration: _isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const ProjectTaskListInput(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
