import 'package:flutter/cupertino.dart';
import 'package:flutter_dojo_step_counter/services/steps_service.dart';

enum StepsStateProcess { loading, complete, error }

class StepsState extends ChangeNotifier {
  final StepsService stepsService;

  var stepsStateProcess = StepsStateProcess.loading;

  int dailySteps = 0;
  var weeklySteps = <DateTime, int>{};

  StepsState(this.stepsService) {
    print('StepsState Constructor');
  }

  void readSteps() async {
    stepsStateProcess = StepsStateProcess.loading;
    notifyListeners();

    weeklySteps = await stepsService.readSteps();
    if (weeklySteps.isNotEmpty) {
      dailySteps = weeklySteps.values.last;
      stepsStateProcess = StepsStateProcess.complete;
    } else {
      stepsStateProcess = StepsStateProcess.error;
    }

    notifyListeners();
  }
}
