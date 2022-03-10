import 'package:example/items/project_detail_board.dart';
import 'package:example/model/project_title_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../model/input_data.dart';

class ProjectListItem extends StatefulWidget {
  final int index;
 final ProjectTitleModel title;
 final int numberOfTasks;

  ProjectListItem({this.index, this.title, this.numberOfTasks});

  @override
  State<ProjectListItem> createState() => _ProjectListItemState();
}

class _ProjectListItemState extends State<ProjectListItem> {
  int taskDone = 2;

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<InputData>(context);
    return Container(
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
              subtitle: Text('${widget.numberOfTasks} Tasks'),
            ),
          ),
          CircularPercentIndicator(
            circularStrokeCap: CircularStrokeCap.round,
            radius: 60.0,
            lineWidth: 5.0,
            percent: 0.8,
            //double.parse(taskData.percent())
            center: Text(
              '${taskData.doublePercent()} %',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.blue[900],
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProjectDetailBoard(index: widget.title.id.toString()),
                ),
              );
            },
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
