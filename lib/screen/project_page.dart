import 'package:example/input_form/project_task_list_input.dart';
import 'package:example/input_form/project_title_input.dart';
import 'package:example/model/project_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../items/button.dart';
import '../items/project_list_item.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Projects',
          style: Theme.of(context).textTheme.copyWith().bodyText1,
        ),
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
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const ProjectTitleInput(),
                  );
                },colour: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
      body: Consumer<ProjectInputData>(
        builder: (context, data, child) => ListView.builder(
          itemCount: data.projectTitle.length,
          itemBuilder: (context, index) => ProjectListItem(
            title: data.projectTitle[index],
            numberOfTasks: data.project.length,
            index: index,
          ),
        ),
      ),
    );
  }
}