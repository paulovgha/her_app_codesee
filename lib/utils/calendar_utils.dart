class CalendarUtils {
  static String dateTimeToString({required DateTime dateTime}) {
    return "${concatDayWithNumber(dateTime.month)}-${concatDayWithNumber(dateTime.day)}-${dateTime.year}";
  }

  static String dateTimeToStringBar({required DateTime dateTime}) {
    return "${concatDayWithNumber(dateTime.month)}/${concatDayWithNumber(dateTime.day)}/${dateTime.year}";
  }

  static String dateTimeYearToString({required DateTime dateTime}) {
    return "${dateTime.year}-${concatDayWithNumber(dateTime.month)}-${concatDayWithNumber(dateTime.day)}";
  }

  static int differenceBetweenInDays(
      {required DateTime dateTime1, required DateTime dateTime2}) {
    return dateTime1.difference(dateTime2).inDays;
  }

  static String concatDayWithNumber(int day) {
    String dayConcat = '';
    if (day < 10) {
      dayConcat = '0$day';
    } else {
      dayConcat = day.toString();
    }

    return dayConcat;
  }
}
