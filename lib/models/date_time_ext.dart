extension DateTimeExt on DateTime {
  bool isToday() {
    final now = DateTime.now().subtract(Duration(days: 1));
    return this.day == now.day &&
        this.month == now.month &&
        this.year == now.year;
  }
}
