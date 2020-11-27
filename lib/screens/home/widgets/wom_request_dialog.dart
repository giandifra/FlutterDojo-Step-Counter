import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/providers/wom_state.dart';
import 'package:provider/provider.dart';

class WomRequestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final womResponseState = Provider.of<WomState>(context);
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (womResponseState.error != null)
            Text(womResponseState.error)
          else if (womResponseState.response != null) ...[
            Text('Processo completato'),
            Text('Hai ottenuto ${womResponseState.response.womCount}  WOM'),
            Text(womResponseState.response.womLink),
            Text(womResponseState.response.womPassword),
          ] else ...[
            Text('Elaborazione in corso'),
          ]
        ],
      ),
    );
  }
}
