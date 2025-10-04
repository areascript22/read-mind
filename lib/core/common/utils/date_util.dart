import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString).toLocal();
      final formatter = DateFormat("MMM dd, yyyy");
      return formatter.format(dateTime);
    } catch (e) {
      return isoString;
    }
  }

  static String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat("MMM dd, yyyy");
    return formatter.format(dateTime);
  }
}
