import 'package:flutter/material.dart';

class DailySteps extends StatelessWidget {
  final int steps;

  const DailySteps({Key key, @required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$steps\npassi',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 50),
    );
  }
}
