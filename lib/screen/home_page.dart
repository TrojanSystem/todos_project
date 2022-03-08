import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../items/time_teller.dart';
import '../model/input_data.dart';
import '../items/button.dart';
import '../items/progress_container_item.dart';
import '../items/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String time = "";

  String day = "";

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      day = DateFormat.yMMMMd().format(DateTime.now());
      time = DateFormat.jm().format(DateTime.now());
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List taskData= Provider.of<InputData>(context).taskLists;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 48.0, right: 30),
              child: AddButton(),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Text(
                    'Task Manager',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 ProgressContainerItem(index:taskData.length),
                const SizedBox(
                  height: 10,
                ),
                TimeTeller(time: time, day: day),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Consumer<InputData>(
              builder: (context, data, child) => ListView.builder(
                itemCount: data.taskLists.length,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    task: data.taskLists[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
