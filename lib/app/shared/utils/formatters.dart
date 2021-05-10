import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static String dateFormatting(String dateTime) {
    return DateFormat("dd/MM/yyyy").format(DateTime.parse(dateTime));
  }

  static String dateFormatting2(String dateTime) {
    return DateFormat("dd/MM/yy").format(DateTime.parse(dateTime));
  }
}
