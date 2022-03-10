import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:example/model/input_data.dart';
import 'package:example/model/project_todo_input_data.dart';
import 'package:example/screen/project_page.dart';
import 'package:example/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'model/project_title_input_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> page = const [
    HomePage(),
    ProjectPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => InputData()..loadTaskList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProjectTitleInputData()..loadProjectTitleList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProjectTodoInputData()..loadProjectTodoList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Project',
        theme: themes,
        home: Scaffold(
          body: page[_selectedIndex],
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.blue[800],
            items: const [
              TabItem(
                icon: FontAwesomeIcons.tasks,
                title: 'TaskList',
              ),
              TabItem(
                icon: FontAwesomeIcons.puzzlePiece,
                title: 'Projects',
              ),
            ],
            initialActiveIndex: _selectedIndex, //optional, default as 0
            onTap: (int i) {
              setState(() {
                _selectedIndex = i;
              });
            },
          ),
        ),
      ),
    );
  }
}
