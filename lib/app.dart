import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/services/steps_service.dart';
import 'package:provider/provider.dart';

import 'providers/steps_state.dart';
import 'screens/home/home_page.dart';

// Radice dell'albero dei widget
class StepCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StepsState>(
      create: (context) => StepsState(StepsService())..readSteps(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
