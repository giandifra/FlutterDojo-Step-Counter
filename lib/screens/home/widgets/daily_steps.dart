import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/providers/steps_state.dart';
import 'package:flutter_dojo_step_counter/providers/wom_state.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/wom_repository.dart';
import 'package:provider/provider.dart';

import 'wom_request_dialog.dart';

class DailySteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('DailySteps build');
    final steps = context.watch<StepsState>().dailySteps;

    return Column(
      children: <Widget>[
        Text(
          '$steps\npassi',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50),
        ),
        if (steps >= 30)
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ChangeNotifierProvider<WomState>(
                      create: (_) => WomState(
                          Provider.of<WomRepository>(context, listen: false))
                        ..getWoms(5100, 0.0, 0.0),
                      child: Center(
                        child: WomRequestDialog(),
                      ),
                    );
                  });
            },
            child: Text('Ottieni WOM'),
          )
      ],
    );
  }
}
