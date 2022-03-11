import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../input_form/add_task.dart';
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
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final numberOfCompletedTask = Provider.of<InputData>(context)
        .taskLists
        .where((element) => element.isCompeleted == true)
        .toList();
    Provider.of<InputData>(context).taskDone = numberOfCompletedTask.length;
    final numberOfTotalTask = Provider.of<InputData>(context).taskLists.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0, right: 30),
              child: AddButton(
                navigateToPage: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AddTask(),
                    ),
                  );
                },
                colour: Colors.green[600],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
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
                  height: 10,
                ),
                ProgressContainerItem(
                  taskDone: numberOfCompletedTask.length,
                  totalTask: numberOfTotalTask,
                ),
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
              builder: (context, data, child) => data.taskLists.isEmpty
                  ? const Center(
                      child: Text(
                        'No Task Yet!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  : data.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.taskLists.length,
                          itemBuilder: (context, index) {
                            return TaskListItem(
                              task: data.taskLists[index],
                              index: index,
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
