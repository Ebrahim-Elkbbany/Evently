import 'package:intl/intl.dart';

abstract class GetDateAndMonth {
 static DateTime getEventDateTime(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  static String getDay(int date) {
    DateTime eventDateTime = getEventDateTime(date);
    return DateFormat('dd').format(eventDateTime);
  }

  static String getMonth(int date) {
    DateTime eventDateTime = getEventDateTime(date);
    return DateFormat('MMM').format(eventDateTime);
  }
}
