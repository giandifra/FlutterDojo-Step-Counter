import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/providers/steps_state.dart';
import 'package:provider/provider.dart';

class WeeklySteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepsState = context.watch<StepsState>();

    if (stepsState.stepsStateProcess == StepsStateProcess.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (stepsState.stepsStateProcess == StepsStateProcess.error) {
      return Center(
        child: Text('Si è verificato un errore imprevisto'),
      );
    }

    return Container(
      height: 250,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (int i = stepsState.weeklySteps.length; i > 0; i--)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      stepsState.weeklySteps.values.elementAt(i - 1).toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text((stepsState.weeklySteps.keys.elementAt(i - 1))
                        .toString()),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
