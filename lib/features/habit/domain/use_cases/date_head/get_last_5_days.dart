class GetLast5Days {
  final currentDate = DateTime.now();

  List<Map<String, String>> call() {
    return _getDates();
  }

  List<Map<String, String>> _getDates() {
    List<Map<String, String>> dates = [];
    DateTime day;

    for (int i = 0; i < 5; i++) {
      day = currentDate.subtract(Duration(days: i));
      dates.add({
        "date": dateToString(day),
        "day": dateToStringDay(day),
      });
    }

    return dates;
  }

  String dateToString(DateTime day) {
    return "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}";
  }

  String dateToStringDay(DateTime day) {
    return ["mon", "tue", "wed", "thu", "fri", "sat", "sun"][day.weekday - 1];
  }
}
