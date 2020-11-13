import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/providers/steps_state.dart';
import 'package:provider/provider.dart';

import 'widgets/daily_steps.dart';
import 'widgets/weekly_steps.dart';

class HomePage extends StatelessWidget {
  // Data corrente
  final _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print('HomePageState build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatore passi'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              _date.toIso8601String(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Spacer(),
            DailySteps(),
            Spacer(),
            WeeklySteps(),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          //leggo i passi
          context.read<StepsState>().readSteps();
        },
      ),
    );
  }
}
