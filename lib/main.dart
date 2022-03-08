import 'package:example/model/input_data.dart';
import 'package:example/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => InputData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themes,
        home: const HomePage(),
      ),
    );
  }
}
