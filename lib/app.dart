import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/services/steps_service.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/local_data_sources.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/remote_data_sources.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/wom_repository.dart';
import 'package:provider/provider.dart';

import 'providers/steps_state.dart';
import 'screens/home/home_page.dart';

// Radice dell'albero dei widget
class StepCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StepsState>(
          create: (context) => StepsState(StepsService())..readSteps(),
        ),
        Provider<WomRepository>(
          create: (_) => WomRepositoryImpl(
            WomRemoteDataSourceImpl(),
            WomLocalSqlDataSourceImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );

    // return ChangeNotifierProvider<StepsState>(
    //   create: (context) => StepsState(StepsService())..readSteps(),
    //   child: MaterialApp(
    //     home: HomePage(),
    //   ),
    // );
  }
}
