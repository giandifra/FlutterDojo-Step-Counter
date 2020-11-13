extension DateTimeExt on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return this.day == now.day &&
        this.month == now.month &&
        this.year == now.year;
  }

  DateTime get midnight => DateTime(this.year, this.month, this.day);
}
