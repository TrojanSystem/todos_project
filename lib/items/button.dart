import 'package:example/input_form/add_task.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function navigateToPage;
  Color colour;

  AddButton({
    this.colour,
    this.navigateToPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToPage,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colour, colour.withOpacity(0.7)],
              begin: const Alignment(0.0, -1.0),
              end: const Alignment(0.0, 1.0)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
