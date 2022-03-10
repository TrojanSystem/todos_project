import 'package:example/model/project_title_input_data.dart';
import 'package:example/model/project_title_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectTitleInput extends StatefulWidget {
  const ProjectTitleInput({Key key}) : super(key: key);

  @override
  State<ProjectTitleInput> createState() => _ProjectTitleInputState();
}

class _ProjectTitleInputState extends State<ProjectTitleInput> {
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
                var projectModel = ProjectTitleModel(title: projectTitle);
                Provider.of<ProjectTitleInputData>(context, listen: false)
                    .addProjectTitleList(projectModel);
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
                  'Add ProjectTitle',
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
