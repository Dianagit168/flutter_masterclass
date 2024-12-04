import 'package:flutter_maserclass/model/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDay) {
  final toDay = DateTime.now();
  return completedDay.any(
    (date) =>
        date.year == toDay.year &&
        date.month == toDay.month &&
        date.day == toDay.day,
  );
}

// prepare heatmap dataset
Map<DateTime, int> prepHeatmapDataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedDays) {
      //normalize date to avoid time mistach
      final normalizedDate = DateTime(date.year, date.month, date.day);

      //if the date already exists in the dataset, increment its count
      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else
        dataset[normalizedDate] = 1;
    }
  }
  return dataset;
}
