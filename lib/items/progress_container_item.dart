import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../model/input_data.dart';

class ProgressContainerItem extends StatefulWidget {
  final int index;

  ProgressContainerItem({
    this.index,
  });

  @override
  State<ProgressContainerItem> createState() => _ProgressContainerItemState();
}

class _ProgressContainerItemState extends State<ProgressContainerItem> {
  int taskDone = 2;

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<InputData>(context);
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.only(left: 20),
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          CircularPercentIndicator(
            circularStrokeCap: CircularStrokeCap.round,
            radius: 80.0,
            lineWidth: 9.0,
            percent: 0.8, //double.parse(taskData.percent())
            center: Text(
              '${taskData.doublePercent()} %',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.blue[900],
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daily Progress',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: taskDone.toString(),
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                    ),
                    TextSpan(
                      text: ' / ',
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                    ),
                    TextSpan(
                      text: widget.index.toString(),
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                    ),
                    const TextSpan(
                      text: ' Task done',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
