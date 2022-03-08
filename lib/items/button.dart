import 'package:example/input_form/add_task.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const AddTask(),
          ),
        );
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green[600], Colors.green[600].withOpacity(0.7)],
              begin: const Alignment(0.0, -1.0),
              end: const Alignment(0.0, 1.0)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
