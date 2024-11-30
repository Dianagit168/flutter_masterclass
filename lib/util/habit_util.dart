bool isHabitCompletedToday(List<DateTime> completedDay) {
  final toDay = DateTime.now();
  return completedDay.any(
    (date) =>
        date.year == toDay.year &&
        date.month == toDay.month &&
        date.day == toDay.day,
  );
}
