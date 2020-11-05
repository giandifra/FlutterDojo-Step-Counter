import '../models/date_time_ext.dart';
import 'package:fit_kit/fit_kit.dart';

class StepsService {
  // Metodo per leggere i passi effettuati
  Future<int> readSteps() async {
    final permission = await FitKit.requestPermissions([DataType.STEP_COUNT]);
    if (permission) {
      try {
        final results = await FitKit.read(
          DataType.STEP_COUNT,
          dateFrom: DateTime.now().subtract(Duration(days: 2)),
          dateTo: DateTime.now(),
        );
        int steps = 0;
        for (final item in results) {
          if (item.dateTo.isToday()) {
            steps += item.value;
          }
        }
        return steps;
      } on UnsupportedException catch (e) {
        print(e);
        return -1;
      } catch (e) {
        print(e);
        return -1;
      }
    } else {
      return -1;
    }
  }
}
