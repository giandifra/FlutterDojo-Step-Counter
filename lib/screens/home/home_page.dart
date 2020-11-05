import 'dart:math';

import 'package:fit_kit/fit_kit.dart';
import 'package:flutter/material.dart';
import 'package:stepcounter/screens/home/widgets/weekly_steps.dart';
import 'package:stepcounter/services/steps_service.dart';

import 'widgets/daily_steps.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Passi da mostrare
  int _steps = 0;

  // Data corrente
  final _date = DateTime.now();
  StepsService stepsService;
  @override
  void initState() {
    super.initState();
    stepsService = StepsService();
  }

  @override
  Widget build(BuildContext context) {
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
            DailySteps(
              steps: _steps,
            ),
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
          var newSteps = await stepsService.readSteps();

          // Aggiorno l'interfaccia
          setState(() {
            _steps = newSteps;
          });
        },
      ),
    );
  }
}
