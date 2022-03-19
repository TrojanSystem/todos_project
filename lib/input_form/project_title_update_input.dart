import 'dart:math';

import 'package:example/model/project_title_input_data.dart';
import 'package:example/model/project_title_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ProjectTitleUpdateInput extends StatefulWidget {
  final int index;
  final String existedProjectTitle;

  const ProjectTitleUpdateInput({this.index, this.existedProjectTitle});

  @override
  State<ProjectTitleUpdateInput> createState() =>
      _ProjectTitleUpdateInputState();
}

class _ProjectTitleUpdateInputState extends State<ProjectTitleUpdateInput> {
  @override
  void initState() {
    randomRed = Random().nextInt(200) + 10;
    randomGreen = Random().nextInt(200) + 10;
    randomBlue = Random().nextInt(200) + 10;
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  String projectTitle = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const Divider(color: Colors.grey, thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 28, 18, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Project Title',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.existedProjectTitle,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Project Title can\'t be empty';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    projectTitle = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter the title of the Project',
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                var projectModel = ProjectTitleModel(
                  id: widget.index,
                  title: projectTitle,
                );
                Provider.of<ProjectTitleInputData>(context, listen: false)
                    .updateProjectTitleList(projectModel);
                Navigator.of(context).pop();
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                child: Text(
                  'Update ProjectTitle',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
