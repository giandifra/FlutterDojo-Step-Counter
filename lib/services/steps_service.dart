import '../models/date_time_ext.dart';
import 'package:fit_kit/fit_kit.dart';

class StepsService {
  // Metodo per leggere i passi effettuati
  Future<Map<DateTime, int>> readSteps() async {
    final permission = await FitKit.requestPermissions([DataType.STEP_COUNT]);
    if (permission) {
      try {
        final now = DateTime.now();

        final results = await FitKit.read(
          DataType.STEP_COUNT,
          dateFrom: DateTime(now.year, now.month, now.day)
              .subtract(Duration(days: 7)),
          dateTo: now,
        );

        final weeklySteps = <DateTime, int>{};

        for (final item in results) {
          final date = item.dateTo.midnight;
          if (weeklySteps.containsKey(date)) {
            weeklySteps[date] += item.value;
          } else {
            weeklySteps[date] = item.value;
          }
        }
        return weeklySteps;
      } on UnsupportedException catch (e) {
        print(e);
        return <DateTime, int>{};
      } catch (e) {
        print(e);
        return <DateTime, int>{};
      }
    } else {
      return <DateTime, int>{};
    }
  }
}
