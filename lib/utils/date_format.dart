// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DateTimeFormatConvert {
  static String convertDateFormat(
      {required String datetime, required String format}) {
    try {
      String result = DateFormat(format).format(DateTime.parse(datetime));
      return result;
    } catch (err) {
      return "";
    }
  }
}
