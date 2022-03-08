import 'package:flutter/material.dart';

class TimeTeller extends StatelessWidget {
  const TimeTeller({
    Key key,
    @required this.time,
    @required this.day,
  }) : super(key: key);

  final String time;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            time,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
