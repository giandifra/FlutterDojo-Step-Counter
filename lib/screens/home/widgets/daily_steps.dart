import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/providers/steps_state.dart';
import 'package:provider/provider.dart';

class DailySteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('DailySteps build');
    final steps = context.watch<StepsState>().dailySteps.toString();

    return Text(
      '$steps\npassi',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 50),
    );
  }
}
