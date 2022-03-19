import 'package:example/input_form/project_task_list_input.dart';
import 'package:example/input_form/project_title_input.dart';
import 'package:example/model/project_title_input_data.dart';
import 'package:example/model/project_todo_input_data.dart';
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
                },
                colour: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
      body: Consumer<ProjectTitleInputData>(
        builder: (context, data, child) => data.projectTitleLists.isEmpty
            ? const Center(
                child: Text(
                  'No Project Yet!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: data.projectTitleLists.length,
                itemBuilder: (context, index) => ProjectListItem(
                  title: data.projectTitleLists[index],
                  index: index,
                ),
              ),
      ),
    );
  }
}
