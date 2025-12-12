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

  static String formatDateWithTime(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString).toLocal();
      final formatter = DateFormat("MMM dd, yyyy – HH:mm");
      return formatter.format(dateTime);
    } catch (e) {
      return isoString;
    }
  }

  static String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat("MMM dd, yyyy");
    return formatter.format(dateTime);
  }

  static String formatDateWithDays(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) return 'Hoy';
    if (difference.inDays == 1) return 'Ayer';
    if (difference.inDays < 7) return '${difference.inDays}d';
    if (difference.inDays < 30) return '${(difference.inDays / 7).floor()}sem';
    return '${(difference.inDays / 30).floor()}m';
  }
}
