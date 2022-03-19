import 'package:example/input_form/project_title_update_input.dart';
import 'package:example/items/project_detail_board.dart';
import 'package:example/model/project_title_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../model/project_title_input_data.dart';
import '../model/project_todo_input_data.dart';

class ProjectListItem extends StatefulWidget {
  final int index;
  final ProjectTitleModel title;

  ProjectListItem({this.index, this.title});

  @override
  State<ProjectListItem> createState() => _ProjectListItemState();
}

class _ProjectListItemState extends State<ProjectListItem> {
  @override
  Widget build(BuildContext context) {
    final selectedTodo = Provider.of<ProjectTodoInputData>(context)
        .projectTodoLists
        .where((element) => element.indexs == widget.title.id.toString())
        .toList();
    final taskData = Provider.of<ProjectTodoInputData>(context, listen: false);
    return GestureDetector(
      onDoubleTap: () {
        Provider.of<ProjectTitleInputData>(context,listen: false)
            .deleteProjectTitleList(widget.title.id);
      },
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => ProjectTitleUpdateInput(
            index: widget.title.id,
            existedProjectTitle: widget.title.title,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20,
        ),
        padding: const EdgeInsets.only(left: 20),
        height: 75,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: ListTile(
                title: Text(
                  widget.title.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('${selectedTodo.length} Tasks'),
              ),
            ),
            CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              radius: 60.0,
              lineWidth: 5.0,
              percent:
                  double.parse(taskData.percent(widget.title.id.toString())),
              center: Text(
                '${taskData.doublePercent(widget.title.id.toString())} %',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              progressColor: Colors.blue[900],
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProjectDetailBoard(
                      indexOfClick: widget.title.id.toString(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
        decoration: BoxDecoration(
          //color: Color.fromRGBO(randomRed,randomGreen, randomBlue, 1),
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
