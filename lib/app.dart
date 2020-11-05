import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';

// Radice dell'albero dei widget
class StepCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
